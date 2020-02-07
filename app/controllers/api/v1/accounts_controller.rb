module Api
    module V1
        class AccountsController < ApplicationController
            def create
                account = Account.new({username: params["account"]["username"]})
                if account.save
                    c = params["character"]
                    character = {
                        name: c["name"],
                        profile_image: c["profile_image"],
                        avatar: c["avatar"],
                        server: c["server"],
                        api_id: c["account_id"],
                        account_id: account.id,
                        primary: true
                    }
                    character = Character.new(character) 
                    if character.save
                        render json: { valid: true } 
                    else
                        render json: { valid: false }
                    end
                else
                    render json: { valid: false } 
                end             
            end

            def validate
                if params["name"]
                    if account = Account.all.find{|account|account.username == params["name"]}
                        render json: { valid: true, account: account, communities: account.communities, characters: account.characters }
                    else 
                        render json: { valid: false }
                    end
                else
                    render json: { valid: false }
                end
            end

            def validate_new
                if account = Account.all.find{|account|account.username == params["name"]}
                    render json: { valid: false }
                else 
                    render json: { valid: true }
                end
            end
        end
    end
end

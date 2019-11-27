module Api
    module V1
        class AccountsController < ApplicationController
            def validate
                if account = Account.all.find{|account|account.username == params["name"]}
                    render json: { valid: true, account: account, communities: account.communities, characters: account.characters }
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

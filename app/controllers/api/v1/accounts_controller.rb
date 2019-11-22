module Api
    module V1
        class AccountsController < ApplicationController
            def validate
                if account = Account.all.find{|account|account.username == params["name"]}
                    render json: { valid: true, account: account }
                else 
                    render json: { valid: false }
                end
            end
        end
    end
end

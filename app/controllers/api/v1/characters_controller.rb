module Api
    module V1
        class CharactersController < ApplicationController
            def index
                characters = Character.all
                render json: characters
            end

            def show
                character = Character.find(params[:id])
                render json: character
            end

            def account_index
                characters = Character.all.select{|character|character.account_id == params[:id].to_i}
                render json: characters
            end
        end
    end
end
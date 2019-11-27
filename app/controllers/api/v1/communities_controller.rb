module Api
    module V1
        class CommunitiesController < ApplicationController
            def index
                render json: Community.all
            end
            def show
                if community = Community.all.find{|community|community.api_id == params[:id].to_s}
                    render json: { community: community, characters: community.characters } 
                else community = Community.find(params[:id]) 
                    render json: { community: community, characters: community.characters } 
                end
            end

            def character_index
                character = Character.find(params[:id])
                render json: character.communities
            end

            def account_index
                communities = Community.all.select{|community| community.account_ids.include?(params[:id].to_i)}
                render json: communities
            end
        end
    end
end

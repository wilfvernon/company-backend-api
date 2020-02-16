module Api
    module V1
        class CommunityCharactersController < ApplicationController
            def index
                render json: CommunityCharacter.all
            end

            def create
                cc = CommunityCharacter.new({
                    community_id: params["community_id"],
                    character_id: params["character_id"],
                    role: "member"
            })
            render json: cc.save ? { valid: true, community: Community.find(params["community_id"]) } : { valid: false }
            end
        end
    end
end

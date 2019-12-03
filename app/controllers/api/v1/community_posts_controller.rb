module Api
    module V1
        class CommunityPostsController < ApplicationController
            def create 
                cp={
                    text: params["text"],
                    community_thread_id: params["target_id"],
                    character_id: params["character_id"]
                }
                cp = CommunityPost.create(cp)
            end
        end
    end
end

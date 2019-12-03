module Api
    module V1
        class EventPostsController < ApplicationController
            def create
                ep={
                    text: params["text"],
                    event_thread_id: params["target_id"],
                    character_id: params["character_id"]
                }
                ep = EventPost.create(ep)
            end
        end
    end
end

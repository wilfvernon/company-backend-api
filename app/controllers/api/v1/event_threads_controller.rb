module Api
    module V1
        class EventThreadsController < ApplicationController
            def event_index
                threads = Event.find(params["id"]).event_threads
                render json: threads.map{|thread|{thread: thread, poster: thread.character}}
            end

            def create
                et={
                    title: params["title"],
                    event_id: params["target_id"],
                    character_id: params["character_id"]
                }
                et = EventThread.create(et)
                
                ep={
                    text: params["text"],
                    event_thread_id: et.id,
                    character_id: params["character_id"]
                }
                ep = EventPost.create(ep)
            end

            def show
                et = EventThread.find(params[:id])
                render json: {thread: et, posts: et.posts, poster: et.character}
            end
        end
    end
end

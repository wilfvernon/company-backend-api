module Api
    module V1
        class CommunityThreadsController < ApplicationController
            def community_index
                threads = Community.find(params["id"]).community_threads
                render json: threads.map{|thread|{thread: thread, poster: thread.character}}
            end

            def create
                ct={
                    title: params["title"],
                    community_id: params["target_id"],
                    character_id: params["character_id"]
                }
                ct = CommunityThread.create(ct)
                
                cp={
                    text: params["text"],
                    community_thread_id: ct.id,
                    character_id: params["character_id"]
                }
                cp = CommunityPost.create(cp)
            end

            def show
                ct = CommunityThread.find(params[:id])
                render json: {thread: ct, posts: ct.posts, poster: ct.character}
            end
        end
    end
end

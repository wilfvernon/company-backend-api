module Api
    module V1
        class CommunitiesController < ApplicationController
            def index
                render json: Community.all
            end
            def show
                if community = Community.all.find{|community|community.api_id == params[:id].to_s}
                    render json: { community: community, members: community.members, admins: community.admins } 
                else community = Community.find(params[:id]) 
                    render json: { community: community, members: community.members, admins: community.admins, events: community.events.map{|event|event_json(event)}} 
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

            def search
                if params["query"] != ""
                    communities = Community.select{|community|community.name.downcase.include?(params["query"].downcase)}
                    render json: communities
                else render json: []
                end
            end

            private

            def event_json(event)
                e = {
                    id: event.id,
                    name: event.name,
                    category: event.category,
                    location: event.location, 
                    community: event.community_id ? Community.find(event.community_id).name : "None",
                    community_id: event.community_id,
                    description: event.description,
                    purpose: event.purpose ? event.purpose : nil,
                    organiser: event.organiser,
                    content: event.contents[0],
                    icon: event.icon,
                    members: event.characters,
                    time: {
                        date: event.start_time.strftime("%d-%m-%y"), 
                        dateString: event.start_time.strftime("%A, %d %B"), 
                        start: event.start_time,
                        start_time: event.start_time.strftime("%H:%M"), 
                        end: event.end_time,
                        end_time: event.end_time.strftime("%H:%M"),
                        timezone: event.start_time.strftime("%z"),
                        happened: !!(DateTime.now > event.end_time)
                    }
                }
            end
        end
    end
end

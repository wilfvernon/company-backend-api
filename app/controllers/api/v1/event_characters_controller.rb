module Api
    module V1
        class EventCharactersController < ApplicationController
            def index
                render json: EventCharacter.all
            end

            def create
                ec = EventCharacter.new({
                    event_id: params["event_id"].to_i,
                    character_id: params["character_id"].to_i,
                    organiser: false
                })
                event = Event.find(params["event_id"].to_i)

                render json: ec.save ? { valid: true, event: event_json(event) } : { valid: false }
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

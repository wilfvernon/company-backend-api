module Api
    module V1
        class EventsController < ApplicationController
            def index
                events = Event.all
                render json: events
            end

            def account_index
                events = Event.all.select{|event|event.account_ids.include?(params[:id].to_i)}
                events = events.map {|event| event_json(event)}
                render json: events
            end
            
            def create
                e = params["event"]
                event = {
                    name: e["name"],
                    start_time: time_gen(e["start"], e["date"]),
                    end_time: time_gen(e["end"], e["date"]),
                    location: e["location"],
                    purpose: e["purpose"],
                    category: e["category"],
                    description: e["description"],
                    community_id: params["eventCommunityId"]
                }
                event = Event.create(event)

                event_character = {
                    character_id: params["eventCharacterId"],
                    event_id: event.id,
                    organiser: true 
                }

                EventCharacter.create(event_character)

                content_event = {
                    content_id: params["eventContentId"],
                    event_id: event.id
                }
                ContentEvent.create(content_event)
                
            end

            private

            def event_json(event)
                e = {
                    id: event.id,
                    name: event.name,
                    category: event.category,
                    location: event.location, 
                    community: event.community_id ? Community.find(event.community_id).name : nil,
                    purpose: event.purpose ? event.purpose : nil,
                    time: {
                        date: event.start_time.strftime("%d-%m-%y"), 
                        dateString: event.start_time.strftime("%A, %d %B"), 
                        start: event.start_time.strftime("%H:%M"), 
                        end: event.end_time.strftime("%H:%M"),
                        timezone: event.start_time.strftime("%z")}
                    }
            end

            def time_split(time)
                time.split(":").map{|number|number.to_i}
            end

            def date_split(string)
                string.split("-").map{|number|number.to_i}
            end

            def time_gen(time, date)
                t_arr = time_split(time)
                d_arr = date_split(date)
                DateTime.new(d_arr[0], d_arr[1], d_arr[2], t_arr[0], t_arr[1])
            end
        end
    end
end

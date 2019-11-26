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

                event = {
                    name: params["event"]["name"],
                    start_time: time_split(params["event"]["start"]),
                    end_time: time_split(params["event"]["end"]),
                    date: date_split(params["event"]["date"]),
                    location: params["event"]["location"],
                    purpose: params["event"]["purpose"],
                    category: params["event"]["category"],
                    description: params["event"]["description"],
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
                        date: event.date.strftime("%d-%m-%y"), 
                        dateString: event.date.strftime("%A, %d %B"), 
                        start: event.start_time.strftime("%H:%M"), 
                        end: event.end_time.strftime("%H:%M"),
                        timezone: event.date.strftime("%z")}
                    }
            end

            def time_gen(hour, minute)
                Time.local(2019, "nov", 22, hour, minute, 0)
            end

            def time_split(string)
                timeArray = string.split(":").map{|number|number.to_i}
                time_gen(timeArray[0], timeArray[1])
            end

            def date_split(string)
                date = string.split("-").map{|number|number.to_i}
                Date.new(date[0], date[1], date[2])
            end
        end
    end
end

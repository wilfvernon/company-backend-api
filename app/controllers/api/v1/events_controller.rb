module Api
    module V1
        class EventsController < ApplicationController
            def index
                events = Event.all
                render json: events
            end

            def account_index
                events = Event.all.select{|event|event.account_ids.include?(params[:id].to_i)}
                events = events.map do |event|{
                    name: event.name,
                    category: event.category,
                    location: event.location, 
                    community: event.community_id ? Community.find(event.community_id).name : null,
                    time: {
                        date: event.date.strftime("%d-%m-%y"), 
                        dateString: event.date.strftime("%A, %d %B"), 
                        start: event.start_time.strftime("%H:%M"), 
                        end: event.end_time.strftime("%H:%M"),
                        timezone: event.date.strftime("%z")}
                    }
                end
                render json: events
            end
        end
    end
end

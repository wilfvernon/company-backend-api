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
                    event: event, 
                    community: event.community_id ? Community.find(event.community_id).name : null
                    }
                end
                render json: events
            end
        end
    end
end

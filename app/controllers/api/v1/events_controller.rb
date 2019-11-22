module Api
    module V1
        class EventsController < ApplicationController
            def index
                events = Event.all
                render json: events
            end

            def account_index
                events = Event.all.select{|event|event.account_ids.include?(params[:id])}
        end
    end
end

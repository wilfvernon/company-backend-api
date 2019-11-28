module Api
    module V1
        class EventCharactersController < ApplicationController
            def index
                render json: EventCharacter.all
            end

            def create
                ec = EventCharacter.new({
                    event_id: params["event_id"],
                    character_id: params["character_id"],
                    organiser: false
                })

                render json: ec.save ? { valid: true } : { valid: false }
            end
        end
    end
end

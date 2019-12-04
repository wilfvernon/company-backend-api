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

                if ec.save 
                    params[:job_ids].map{|job_id|
                            ecj={
                                job_id: job_id,
                                event_character_id: ec.id,
                                selected: false
                            }
                            EventCharacterJob.create(ecj)
                        }

                    
                    render json: { valid: true, event: event_json(event), ec: {character: ec.character, jobs: ec.event_character_jobs.map{|ecj|{job: ecj.job, id: ecj.id, selected:ecj.selected}}} } 
                else render json: { valid: false }
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

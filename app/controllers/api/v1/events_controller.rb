module Api
    module V1
        class EventsController < ApplicationController
            def index
                events = Event.all
                render json: events
            end

            def show
                event = Event.find(params[:id])
                render json: event_json(event)
            end

            def account_index
                events = Event.all.select{|event|event.account_ids.include?(params[:id].to_i)}
                events = events.sort_by{|event|event.start_time}.map{|event| event_json(event)}
                render json: events
            end

            def account_upcoming_index
                communities = Community.all.select{|community| community.account_ids.include?(params[:id].to_i)}
                members = communities.map{|community|community.characters}.flatten.uniq{|character|character.id}
                events = members.map{|member|member.events}.flatten.uniq{|event|event.id}.select{|event| DateTime.now < event.end_time}.sort_by{|event|event.start_time}.map{|event| event_json(event)}
                render json: events
            end
            
            def create
                e = params["event"]
                byebug
                event = {
                    name: e["name"],
                    start_time: time_gen(e["start"], e["date"]),
                    end_time: time_gen(e["end"], e["date"]),
                    location: e["location"],
                    purpose: e["purpose"],
                    category: e["category"],
                    description: e["description"],
                    community_id: params["eventCommunityId"],
                    icon: e["icon"]
                }
                event = Event.new(event)
                if event.save

                    event_character = {
                        character_id: params["eventCharacterId"],
                        event_id: event.id,
                        organiser: true 
                    }


                    content_event = {
                        content_id: params["eventContentId"],
                        event_id: event.id
                    }

                    event_character=EventCharacter.new(event_character)
                    if event_character.save && ContentEvent.create(content_event)
                        params[:jobIds].map{|job_id|
                            ecj={
                                job_id: job_id,
                                event_character_id: event_character.id,
                                selected: false
                            }
                            EventCharacterJob.create(ecj)
                        }
                        render json: {valid: true, event: event_json(event)}
                    else
                        render json: {valid: false}
                    end
                else
                    render json: {valid: false}
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
                    community_image: event.community_id ? [Community.find(event.community_id).image_base, Community.find(event.community_id).image_mid, Community.find(event.community_id).image_top] : [],
                    community_id: event.community_id,
                    description: event.description,
                    purpose: event.purpose ? event.purpose : nil,
                    organiser: event.organiser,
                    content: event.contents[0],
                    icon: event.icon,
                    members: event.event_characters.select{|ec|!ec.organiser}.map{|ec|{character: ec.character, jobs: ec.event_character_jobs.map{|ecj|{job: ecj.job, id: ecj.id, selected:ecj.selected}}, id: ec.id}},
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

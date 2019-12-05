module Api
    module V1
        class EventCharacterJobsController < ApplicationController
            def update
                ecj = EventCharacterJob.find(params[:id])
                if ecj.selected
                    ecj.update(selected: false)
                else
                    ecj2 = ecj.event_character.event_character_jobs.find{|job|job.selected}
                    if ecj2
                        ecj2.update(selected:false)
                    end
                ecj.update(selected: true)
                end
            end
        end
    end
end

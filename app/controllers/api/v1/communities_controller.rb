module Api
    module V1
        class CommunitiesController < ApplicationController
            def index
                render json: Community.all
            end
            def show
                if community = Community.all.find{|community|community.api_id == params[:id].to_s}
                    render json: community
                else community = Community.find(params[:id]) 
                    render json: community
                end
            end
        end
    end
end

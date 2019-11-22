
module Api
    module V1
        class ContentsController < ApplicationController
            def index
                render json: Content.all
            end
           
        end
    end
end

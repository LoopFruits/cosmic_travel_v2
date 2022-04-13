class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create  
        mission = Mission.create!(mission_params)
        #returning the associated planet data, returning a stauts code of 201
        render json: mission.planet, status: :created
    end



    private 

    def  mission_params
        #after checking the they wanted scientist_id and planet_id 
        params.permit(:name, :scientist_id, :planet_id)
    end

    def render_unprocessable_entity invalid
        #returns error messages and returns a status code of 422
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        #better way to write our error  message, maybe it should just say validation errors
    end
end

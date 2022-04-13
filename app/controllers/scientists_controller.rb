class ScientistsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        #returning an array of all scientists
        render json: Scientist.all
    end

    def show
        scientist = Scientist.find(params[:id])
        # returns the matching scientist with their associated planets 
        #created 3 serializer files and added the association in the scientistandplanet serializer 
        render json: scientist, serializer: ScientistandplanetSerializer
    end

    def create 
        # creating a new scietist 
        scientist = Scientist.create!(scientist_params)
         render json: scientist, status: :created 
    end

    #PATCH 
    def update 
        #recycled code allowed to just add in update 
        scientist = Scientist.find(params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted 
    end


    def destroy
        scientist = Scientist.find(params[:id])
        scientist.destroy
        head :no_content
    end

    private

    
    def render_not_found
        #returning an error message 
        render json: {error: 'Scientist not found'}, status: :not_found
    end

    def scientist_params
        # we're adding our column data from the scientist table 
        params.permit(:name, :field_of_study, :avatar)
    end

    def render_unprocessable_entity invalid
        #retuns the status code of 422(unprocessable entitiy)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end

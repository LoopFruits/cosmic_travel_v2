class PlanetsController < ApplicationController

    def index
        #returning an array of all planets 
        render json: Planet.all
    end
end

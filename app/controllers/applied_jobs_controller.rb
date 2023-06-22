class AppliedJobsController < ApplicationController
    
    def index 
        # byebug
        prepare_search_data
        @q = Apply.ransack(params[:q])
        @applies = @q.result(distinct: true)
    end

    private

    def prepare_search_data
        @cities = City.pluck(:name, :id)
        @industries = Industry.pluck(:title, :id)
        @days = (1..31).to_a
        @months  = (1..12).to_a
        @years = (2021..2025).to_a
        # @selected_year_from = params[:year_from]
    end
end

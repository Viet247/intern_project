class FavouritesController < ApplicationController
    before_action :authenticate_user!
    def create
      job_id = params[:job_id]
      user_id = current_user.id
      if Favourite.exists?(job_id: job_id, user_id: user_id)
        flash[:alert] = "This job is already in your favourites"
        @exists = true
      else
        favourite = Favourite.new(job_id: job_id, user_id: user_id)
        flash[:alert] = "The job has been added into your favourites" if favourite.save
      end
      redirect_to request.referrer
    end
  
    def show
      @favourite_jobs = Job.joins(:users).where(favourites: { user_id: current_user.id })
    end
  
    def destroy
      favourite = Favourite.find_by(job_id: params[:job_id], user_id: current_user.id)
      favourite.destroy
      redirect_to favourite_path
    end
  
    def apply
      redirect_to apply_path(job_id: params[:apply])
    end
end

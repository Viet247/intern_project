class HistoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @history_jobs = Job.joins(:histories).where(histories: {user_id: current_user.id})
  end

  def apply
    redirect_to apply_path(job_id: params[:apply])
  end
end


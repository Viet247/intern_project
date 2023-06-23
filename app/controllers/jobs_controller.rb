class JobsController < ApplicationController

  before_action :authenticate_user!, only: :show
  # get data for top page
  def index
    @total_jobs = Job.count
    @latest_jobs = Job.order(created_at: :desc).limit(5)
    @top_jobs_industries = Industry.order(job_count: :desc).limit(9)
    @top_jobs_cities = City.order(job_count: :desc).limit(9)
  end

  def new
  end

  # simple search
  def search
    @search = Job.search do
      fulltext params[:search] do
        phrase_fields :name => 6.0
        highlight :name
      end
    end
    @jobs = @search.results
    render 'jobs/job_list'
  end

  def show
    @job = Job.find params[:id]
    unless History.exists?(job_id: params[:id], user_id: current_user.id)
      History.create(job_id: params[:id], user_id: current_user.id)
    end
  end
end

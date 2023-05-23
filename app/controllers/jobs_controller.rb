class JobsController < ApplicationController
  def index
    @total_jobs = Job.count
    @latest_jobs = Job.order(created_at: :desc).limit(5)
    @top_jobs_industries = Industry.order(job_count: :desc).limit(9)
    # byebug
    @top_jobs_cities = City.order(job_count: :desc).limit(9)
  end
end
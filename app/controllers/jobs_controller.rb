class JobsController < ApplicationController
  def index
    @total_jobs = Job.count
    @latest_jobs = Job.order(created_at: :desc).limit(5)
    @top_jobs_industries = Industry.order(job_count: :desc).limit(9)
    @top_jobs_cities = City.order(job_count: :desc).limit(9)
  end

  def new
  end

  def search
    @search = Job.search do
      fulltext params[:search] do
        phrase_fields :name => 6.0
        query_phrase_slop 1
        highlight :name
      end
    end
    @jobs = @search.results
    render 'jobs/list'
  end
end


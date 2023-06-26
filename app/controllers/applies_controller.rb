class AppliesController < ApplicationController
  before_action :authenticate_user!
  def new
    unless current_user.curriculum_vitate?
      flash[:notice] = "You must to upload your CV before Applying!"
      return redirect_to my_info_path
    end
    @apply = Apply.new(email: current_user.email, full_name: current_user.full_name) 
    @job = Job.find params[:job_id]
  end

  def show
    @job = Job.find(params[:job_id])
    @apply = Apply.new(email: params[:email],
                      full_name: params[:fullname],
                      user_id: current_user.id,
                      job_id: @job.id,
                      city_id: @job.city_id,
                      industry_id: @job.industry_id)

    unless @apply.valid?
      flash[:notice] = "Email is invalid, please try again!"
      redirect_to request.referrer
    end
  end

  def create
    @job = Job.find(params[:job_id])
    @apply = Apply.new(email: params[:email],
                      full_name: params[:fullname],
                      user_id: current_user.id,
                      job_id: @job.id,
                      city_id: @job.city_id,
                      industry_id: @job.industry_id)
    @apply.cv = current_user.curriculum_vitate
    if Apply.exists?(job_id: @apply.job_id, user_id: @apply.user_id)
      flash[:alert] = "This job is applied, please choose another job! "
      redirect_to request.referrer
    else
      @apply.save
      ApplyMailer.with(user: current_user, apply_job: @apply, job: @job).apply_notice.deliver_now
      redirect_to done_path
    end
  end

  def done
  end

  def see_applied_jobs
    @applied_jobs = current_user.jobs.select("jobs.*, applies.created_at as applied_at").joins(:applies)
  end
end

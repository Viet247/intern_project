class AppliesController < ApplicationController
  
  def new
    unless current_user.curriculum_vitate?
      flash[:notice] = "You must to upload your CV before Applying!"
      return redirect_to my_info_path
    end
    @apply = Apply.new(email: current_user.email, full_name: current_user.full_name) 
    session[:job_id] = params[:job_id]
  end

  def show
    @apply = Apply.new(session[:apply])
  end

  def confirm
    job = Job.find(session[:job_id])
    apply = Apply.new(email: params[:email],
                      full_name: params[:fullname],
                      user_id: current_user.id,
                      job_id: session[:job_id],
                    city_id: job.city_id,
                  industry_id: job.industry_id)

    if apply.valid?
      session[:apply] = apply
      redirect_to confirm_path
    else
      flash[:notice] = "Email is invalid, please try again!"
      redirect_to request.referrer
    end
  
  end

  def create
    apply = Apply.new(session[:apply])
    apply.cv = current_user.curriculum_vitate
    if Apply.exists?(job_id: apply.job_id, user_id: apply.user_id)
      flash[:alert] = "This job is applied, please choose another job! "
      redirect_to request.referrer
    else
      apply.save
      ApplyMailer.with(user: current_user, apply_job: apply, job: Job.find(apply.job_id)).apply_notice.deliver_now
      session.delete(:job_id)
      session.delete(:apply)
      redirect_to done_path
    end
  end

  def done
  end

  def see_applied_jobs
    @applied_jobs = current_user.jobs.select("jobs.*, applies.created_at as applied_at").joins(:applies)
  end
end

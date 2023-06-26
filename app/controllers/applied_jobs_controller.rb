class AppliedJobsController < ApplicationController
    
    def index 
        prepare_search_data
        @q = Apply.ransack(params[:q])
        @applies = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(5)
    end

    def download_csv
        job_applies = Apply.where(id: params[:job_apply_ids])
        csv_file = CSV.generate do |csv|
            csv << ['id', 'title', 'description', 'salary', 'applied_at', 'cv', 'fullname', 'email','job_id','user_id']
            job_applies.each_with_index do |job_apply, index|
                csv << [job_apply.id, job_apply.job.name, job_apply.job.description, job_apply.job.salary, job_apply.created_at, job_apply.cv, job_apply.full_name, job_apply.user.email, job_apply.job_id, job_apply.user_id]
            end
        end

        respond_to do |format|
            format.csv { send_data csv_file,
                filename: "applied_jobs.csv" }
            end
    end
    
    private 

    def prepare_search_data
        @cities = City.pluck(:name, :id)
        @industries = Industry.pluck(:title, :id)
        @days = (1..31).to_a
        @months  = (1..12).to_a
        @years = (2021..2025).to_a
    end
end


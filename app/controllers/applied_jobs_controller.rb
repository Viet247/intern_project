class AppliedJobsController < ApplicationController
    
    def index 
        prepare_search_data
        @current_search_params = search_params
        @q = Apply.ransack(params[:q])
        @applies = @q.result(distinct: true)
        download_jobs
    end
    
    private 

    def search_params
        params.require(:q).permit!
      end
    def download_jobs
      return if params[:download].blank?
    
      if @applies.present?
        csv_file = CSV.generate do |csv|
            csv << ['id', 'title', 'description', 'salary', 'applied_at', 'cv', 'fullname', 'email','job_id','user_id']
            @applies.each do |apply|
              csv << [apply.id, apply.job.name, apply.job.description, apply.job.salary, apply.created_at, apply.cv, apply.full_name, apply.user.email, apply.job_id, apply.user_id]
            end
        end

            
            respond_to do |format|
                format.html
                format.csv { send_data csv_file, filename: "applied_job.csv", type: 'text/csv; charset=utf-8'  }
              end
        
        
      else
          flash[:error] = "No data available to export."
          redirect_to applied_jobs_path
      end
    end

    def prepare_search_data
        @cities = City.pluck(:name, :id)
        @industries = Industry.pluck(:title, :id)
        @days = (1..31).to_a
        @months  = (1..12).to_a
        @years = (2021..2025).to_a
        # @selected_year_from = params[:year_from]
    end
end

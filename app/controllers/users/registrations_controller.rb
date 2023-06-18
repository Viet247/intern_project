class Users::RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    resource.valid?
    if resource.errors[:email].count.zero?
      resource.save(validate: false)
      render :notice
    else
      render :new
    end
  end

  def notice

  end

  def edit
    self.resource = current_user
  end

  def update
    if params[:_method] == 'patch'
      resource
      if resource.update(account_update_params)
        sign_in(resource, bypass: true)
        redirect_to my_path
      else
        render :update
      end
    elsif params[:_method] == 'put'
      if current_user.update(account_update_params)
        flash.now[:alert] = "Update successfully!"
        redirect_to my_path
      else
        render :edit
      end
    end
  end

  private 

  def account_update_params
    params.permit(:full_name, :password, :password_confirmation, :current_password, :curriculum_vitate)
  end
end


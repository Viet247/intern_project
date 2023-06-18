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
        flash.now[:alert] = "Register successfully!"
        sign_in(resource, bypass: true)
        redirect_to my_path
      else
        render :edit
      end
    elsif params[:_method] == 'put'
      if resource.update(account_update_params)
        flash.now[:alert] = "Update successfully!"
        sign_in(resource, bypass: true)
        redirect_to my_path
      else
        render :edit
      end
    end
  end

  private 

  def account_update_params
    params.require(:user).permit(:full_name, :password, :password_confirmation, :curriculum_vitate)
  end
end


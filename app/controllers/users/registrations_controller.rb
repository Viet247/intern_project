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

  def update
    resource
    if resource.update(account_update_params)
      sign_in(resource, bypass: true)
      redirect_to root_path
    else
      render :update
    end
  end

  private 

  def account_update_params
    params.permit(:email, :full_name, :password, :password_confirmation,:curriculum_vitate)
  end
end


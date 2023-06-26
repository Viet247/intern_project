class Users::SessionsController < Devise::SessionsController
  def user_profile
    if(current_user.is_admin?)
      self.resource = User.find(params[:id])
    else
      self.resource = current_user
    end
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    return redirect_to admin_applies_path if resource.is_admin?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def admin_new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end
end



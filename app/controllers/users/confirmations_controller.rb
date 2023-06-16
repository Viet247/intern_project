class Users::ConfirmationsController <  Devise::ConfirmationsController

  def show
    
    self.resource = resource_class.find_by_confirmation_token(params[:confirmation_token])
    redirect_to new_user_session_path if resource.confirmed?
    resource.confirmed_at = Time.now
    resource.save(validate: false)
    sign_in(:user,resource)

    
  end

end


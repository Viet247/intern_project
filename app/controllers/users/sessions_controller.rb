class Users::SessionsController < Devise::SessionsController
  def user_profile
    self.resource = current_user
  end
end



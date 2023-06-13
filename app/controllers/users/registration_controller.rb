class Users::RegistrationController < Devise::RegistrationsController
    def new
      byebug
      self.resource = User.new
      render "users/registration/new"  
    end

    def show
    end
end

class Admin::SessionsController < Devise::SessionsController
  def new
    render "admin/new"
  end
end





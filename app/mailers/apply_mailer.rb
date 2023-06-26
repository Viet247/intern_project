class ApplyMailer < ApplicationMailer
  default from: 'vietbk1424@gmail.com'
  def apply_notice 
    @user = params[:user]
    @job = params[:job]
    @apply = params[:apply_job]
    mail(to: @user.email,
      bcc: User.where(is_admin: 1).pluck(:email),
      subject: 'Thank you for apply with VeNJOB')
  end
end



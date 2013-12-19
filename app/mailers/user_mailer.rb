class UserMailer < ActionMailer::Base
  default from: "noreply@estimatorapp.com"

  def invite(user, email)
    @user = user
    mail(to: email, subject: "Estimator: Project invite from #{user.name}")
  end
end

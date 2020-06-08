class WorkshopMailer < ApplicationMailer
  def welcome_email(user_id)
    @user = User.find(user_id)
    mail(
      to: @user.email,
      subject: "Music Like You Mean It Workshop (Link Inside)"
    )
  end
end

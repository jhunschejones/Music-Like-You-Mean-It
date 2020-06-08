class WorkshopMailerPreview < ActionMailer::Preview
  def welcome_email
    WorkshopMailer.welcome_email(User.last.id)
  end
end

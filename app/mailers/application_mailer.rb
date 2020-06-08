class ApplicationMailer < ActionMailer::Base
  if Rails.env.production?
    default(
      from: 'Josh [Music Like You Mean It] <contact@musiclikeyoumeanit.com>',
      content_type: 'text/html'
    )
  else
    # the brackets work in mailgun but not gmail for local dev
    default(
      from: 'Josh Music Like You Mean It <contact@musiclikeyoumeanit.com>',
      content_type: 'text/html'
    )
  end
  layout 'mailer'
end

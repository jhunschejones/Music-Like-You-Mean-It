desc "Send todays emails"
task send_daily_emails: [:environment] do
  SendDailyEmailJob.perform_later
end

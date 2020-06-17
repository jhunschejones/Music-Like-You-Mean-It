require 'test_helper'

# bundle exec ruby -Itest test/jobs/send_daily_email_job_test.rb
class SendDailyEmailJobTest < ActiveJob::TestCase
  test "does not equeue draft emails" do
    UserMailer.expects(:daily_email).never()
    SendDailyEmailJob.perform_now
  end

  describe "when email is not a draft" do
    before do
      emails(:draft).update(is_draft: false)
    end

    test "does not enqueue future emails" do
      emails(:draft).update(sent_at: Time.now + 1.day)
      UserMailer.expects(:daily_email).never()
      SendDailyEmailJob.perform_now
    end

    test "enqueues emails ready for delivery" do
      test_job = mock()
      test_job.stubs(:deliver_later)

      UserMailer.expects(:daily_email)
                .with(email_id: emails(:draft).id, user_id: users(:site_admin).id)
                .returns(test_job)

      UserMailer.expects(:daily_email)
                .with(email_id: emails(:draft).id, user_id: users(:site_user).id)
                .returns(test_job)

      test_job.expects(:deliver_later).times(2)

      SendDailyEmailJob.perform_now
    end
  end
end

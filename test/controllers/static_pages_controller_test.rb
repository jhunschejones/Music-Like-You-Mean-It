require 'test_helper'

# bundle exec ruby -Itest test/controllers/static_pages_controller_test.rb
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  describe "workshop" do
    describe "on the users first page visit" do
      test "loads the new workshop user page" do
        get workshop_path
        assert_response :success
        assert_select "h2.title", /Sign up/
      end
    end

    describe "on the users second page visit" do
      before do
        post workshop_users_path, params: { user: { name: "Riley", email: "riley@dafox.com" } }
      end

      test "loads the workshop page directly" do
        get workshop_path
        assert_response :success
        assert_select "h2.workshop-title"
      end
    end
  end
end

require 'test_helper'

# bundle exec ruby -Itest test/controllers/sessions_controller_test.rb
class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    https!
    get "/login"
    assert_response :success

    post "/login", params: { email: users(:site_admin).email, password: "secret" }
    follow_redirect!
    assert_equal "/users/#{users(:site_admin).id}", path
  end

  test "logout" do
    login_as(users(:site_admin))
    delete "/logout"
    follow_redirect!
    assert_equal "Succesfully logged out", flash[:notice]
    assert_equal "/login", path
  end

  private

  def login_as(user)
    post "/login", params: { email: user.email, password: "secret" }
  end
end

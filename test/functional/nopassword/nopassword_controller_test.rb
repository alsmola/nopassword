require 'test_helper'

class Nopassword::NopasswordControllerTest < ActionController::TestCase
  test "send_login_email" do
    post :send_login_email, :use_route => :Nopassword, :email => 'me@example.com'
    assert_redirected_to "/"
  end
end

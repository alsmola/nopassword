require 'test_helper'

class NopasswordControllerTest < ActionController::TestCase
  test "send_login_email" do
    post :send_login_email, {:email => 'me@example.com'}
    assert_response :success
  end
end

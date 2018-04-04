require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  include Oath::Test::Helpers

  setup do
    @user = users(:admin_user)
    sign_in(@user)
  end

  test 'can create a user' do
    get new_user_url
    assert_response :success
    assert_difference "User.count", 1 do
      post users_url, params: { user: { email: 'test_user@example.com', password: 'pa$$w0rd!' } }
    end
    assert_redirected_to races_url
  end
end
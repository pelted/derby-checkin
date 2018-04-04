require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  include Oath::Test::Helpers

  test 'can create a registration' do
    get new_session_url
    assert_response :success

    post session_url, params: { session: { email: 'admin_user@example.com', password: 'pa$$w0rd!' } }
    assert_redirected_to races_path
    follow_redirect!
    assert :success
  end

  test 'destroy session' do
    delete session_path
    assert_redirected_to root_path
    follow_redirect!
    assert :success
  end
end
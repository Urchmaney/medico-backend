require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'Should create session registered user' do
    post api_v1_sessions_url, params: { auth:  { username: 'bleon' } }
    assert_response 200
  end

  test 'should not create session for new user' do
    post api_v1_sessions_url, params: { auth:  { username: 'mike' } }
    assert_response 400
  end
end

# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = Auth.issue(username: users(:one).username)
    @user = users(:one)
  end

  test 'should create user' do
    assert_difference('User.count') do
      h_post api_v1_users_url, user: {
        first_name: 'Manny',
        last_name: 'More',
        username: 'mmany'
      }
    end

    assert_response 201
  end
end

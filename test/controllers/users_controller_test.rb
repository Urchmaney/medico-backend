# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = Auth.issue(username: users(:one).username)
    @user = users(:one)
  end

  test 'should get index' do
    h_get api_v1_users_url, @token
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      h_post api_v1_users_url, { user: {
        first_name: 'Manny',
        last_name: 'More',
        username: 'mmany'
      } }, @token
    end

    assert_response 201
  end

  test 'should show user' do
    h_get api_v1_user_url(@user), @token
    assert_response :success
  end

  test 'should update user' do
    h_patch api_v1_user_url(@user), { user: {
      first_name: 'Manny',
      last_name: 'More',
      username: 'mmaney'
    } }, @token
    assert_response 200
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      h_delete api_v1_user_url(@user), @token
    end

    assert_response 204
  end
end

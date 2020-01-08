require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get api_v1_users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: {
        first_name: 'Manny',
        last_name: 'More',
        username: 'mmany'
        } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get api_v1_user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch api_v1_user_url(@user), params: { user: {
        first_name: 'Manny',
        last_name: 'More',
        username: 'mmaney'
      } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user), as: :json
    end

    assert_response 204
  end
end

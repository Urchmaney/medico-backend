require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = Auth.issue({username: users(:one).username})
    @like = likes(:one)
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test "should get index" do
    h_get api_v1_likes_url, @token
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      h_post api_v1_likes_url, { doctor_id: @doctor.id, user_id: @user.id }, @token
    end

    assert_response 201
  end

  test "should show like" do
    h_get api_v1_like_url(@like), @token
    assert_response :success
  end

  test "should update like" do
    h_patch api_v1_like_url(@like), { doctor_id: @doctor.id, user_id: @user.id }, @token
    assert_response 200
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      h_delete api_v1_like_url(@like), @token
    end

    assert_response 204
  end
end

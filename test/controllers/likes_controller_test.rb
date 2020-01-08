require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test "should get index" do
    get api_v1_likes_url, as: :json
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post api_v1_likes_url, params: { doctor_id: @doctor.id, user_id: @user.id }, as: :json
    end

    assert_response 201
  end

  test "should show like" do
    get api_v1_like_url(@like), as: :json
    assert_response :success
  end

  test "should update like" do
    patch api_v1_like_url(@like), params: { doctor_id: @doctor.id, user_id: @user.id }, as: :json
    assert_response 200
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete api_v1_like_url(@like), as: :json
    end

    assert_response 204
  end
end

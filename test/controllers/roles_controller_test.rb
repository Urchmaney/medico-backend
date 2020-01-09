require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
    @token = Auth.issue({username: users(:one).username})
  end

  test "should get index" do
    h_get api_v1_roles_url, @token
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      h_post api_v1_roles_url, { role: { name: 'Gyneacologist' } }, @token
    end

    assert_response 201
  end

  test "should show role" do
    h_get api_v1_role_url(@role), @token
    assert_response :success
  end

  test "should update role" do
    h_patch api_v1_role_url(@role), { role: { name: 'Gyneacologist' } }, @token
    assert_response 200
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      h_delete api_v1_role_url(@role), @token
    end

    assert_response 204
  end
end

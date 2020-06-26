# frozen_string_literal: true

require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role = roles(:one)
    @token = Auth.issue(username: users(:one).username)
  end

  test 'should get index' do
    h_get api_v1_roles_url, @token
    assert_response :success
  end

  test 'should show role' do
    h_get api_v1_roles_url(@role), @token
    assert_response :success
  end
end

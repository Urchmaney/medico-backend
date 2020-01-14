# frozen_string_literal: true

require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = Auth.issue(username: users(:one).username)
    @doctor = doctors(:one)
    @role = roles(:one)
  end

  test 'should get index' do
    h_get api_v1_doctors_url, @token
    assert_response :success
  end

  test 'should create doctor' do
    assert_difference('Doctor.count') do
      h_post api_v1_doctors_url, { doctor: {
        first_name: 'Hunch',
        last_name: 'Moses',
        price: 200,
        role_id: @role.id,
        years_experience: 5
      } }, @token
    end

    assert_response 201
  end

  test 'should show doctor' do
    h_get api_v1_doctor_url(@doctor), @token
    assert_response :success
  end

  test 'should update doctor' do
    h_patch api_v1_doctor_url(@doctor), { doctor: {
      first_name: 'Hunch',
      last_name: 'Moses',
      role_id: @role.id,
      price: 200,
      years_experience: 5
    } }, @token
    assert_response 200
  end

  test 'should destroy doctor' do
    assert_difference('Doctor.count', -1) do
      h_delete api_v1_doctor_url(@doctor), @token
    end

    assert_response 204
  end
end

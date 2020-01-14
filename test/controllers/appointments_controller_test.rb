# frozen_string_literal: true

require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @token = Auth.issue(username: users(:one).username)
    @appointment = appointments(:one)
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test 'should get index' do
    h_get api_v1_appointments_url, @token
    assert_response :success
  end

  test 'should create appointment' do
    assert_difference('Appointment.count') do
      h_post api_v1_appointments_url, {
        appointment: {
          doctor_id: @doctor.id,
          date: DateTime.now,
          time: '2PM'
        }
      }, @token
    end

    assert_response 201
  end

  test 'should show appointment' do
    h_get api_v1_appointment_url(@appointment), @token
    assert_response :success
  end

  test 'should update appointment' do
    h_patch api_v1_appointment_url(@appointment), { appointment: {
      doctor_id: @doctor.id,
      date: DateTime.now,
      time: '2PM'
    } }, @token
    assert_response 200
  end

  test 'should destroy appointment' do
    assert_difference('Appointment.count', -1) do
      h_delete api_v1_appointment_url(@appointment), @token
    end

    assert_response 204
  end
end

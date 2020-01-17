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
end

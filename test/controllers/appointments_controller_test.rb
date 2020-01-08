require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test "should get index" do
    get api_v1_appointments_url, as: :json
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post api_v1_appointments_url, params: {
        appointment: { 
          doctor_id: @doctor.id,
          user_id: @user.id,
          date: DateTime.now,
          time: '2PM' } 
       }, as: :json
    end

    assert_response 201
  end

  test "should show appointment" do
    get api_v1_appointment_url(@appointment), as: :json
    assert_response :success
  end

  test "should update appointment" do
    patch api_v1_appointment_url(@appointment), params: { appointment: { 
      doctor_id: @doctor.id,
      user_id: @user.id,
      date: DateTime.now,
      time: '2PM' } }, as: :json
    assert_response 200
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete api_v1_appointment_url(@appointment), as: :json
    end

    assert_response 204
  end
end

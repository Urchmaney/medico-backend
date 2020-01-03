require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @doctor = doctors(:one)
    @role = roles(:one)
  end

  test "should get index" do
    get doctors_url, as: :json
    assert_response :success
  end

  test "should create doctor" do
    assert_difference('Doctor.count') do
      post doctors_url, params: { doctor: { 
        first_name: 'Hunch',
        last_name: 'Moses',
        price: 200,
        role_id: @role.id,
        years_experience: 5
       } }, as: :json
    end

    assert_response 201
  end

  test "should show doctor" do
    get doctor_url(@doctor), as: :json
    assert_response :success
  end

  test "should update doctor" do
    patch doctor_url(@doctor), params: { doctor: { 
      first_name: 'Hunch',
      last_name: 'Moses',
      role_id: @role.id,
      price: 200,
      years_experience: 5
     } }, as: :json
    assert_response 200
  end

  test "should destroy doctor" do
    assert_difference('Doctor.count', -1) do
      delete doctor_url(@doctor), as: :json
    end

    assert_response 204
  end
end

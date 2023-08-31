# frozen_string_literal: true

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test 'appointment should have date' do
    appointment = Appointment.new(user_id: @user.id, doctor_id: @doctor.id)
    assert_not appointment.save
  end

  test 'appointment should have time' do
    appointment = Appointment.new(user_id: @user.id, doctor_id: @doctor.id)
    assert_not appointment.save
  end

  test 'user doctor increase by one on appointment' do
    assert_difference('@user.doctors.count', 1) do
      Appointment.create(user_id: @user.id, doctor_id: @doctor.id, date: DateTime.now, time: '4PM')
    end
  end

  test 'doctor patience increase by one on appointment' do
    assert_difference('@doctor.patients.count', 1) do
      Appointment.create(user_id: @user.id, doctor_id: @doctor.id, date: DateTime.now, time: '4PM')
    end
  end
end

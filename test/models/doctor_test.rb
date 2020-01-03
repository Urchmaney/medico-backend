require 'test_helper'

class DoctorTest < ActiveSupport::TestCase
  test "can't create doctor without first and last name" do
    doctor = Doctor.create(years_experience: 5, price: 400)
    assert_not doctor.save
  end

  test "can't create doctor without years experience" do
    doctor = Doctor.create(first_name: 'Lucas', last_name: 'Modric', price: 400)
    assert_not doctor.save
  end

  test "can't create doctor without price" do
    doctor = Doctor.create(first_name: 'Lucas', last_name: 'Modric', years_experience: 5)
    assert_not doctor.save
  end
end

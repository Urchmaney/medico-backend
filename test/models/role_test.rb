# frozen_string_literal: true

require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  setup do
    @role = roles(:one)
  end

  test "can't save role without name" do
    role = Role.new
    assert_not role.save
  end

  test 'role should have a name' do
    role = Role.new(name: 'Pregenancy')
    assert role.save
  end

  test 'role can have many doctors' do
    doctor1 = @role.doctors.create(first_name: 'Lucas', last_name: 'Modric', years_experience: 5, price: 200)
    doctor2 = @role.doctors.create(first_name: 'Mores', last_name: 'Ronal', years_experience: 3, price: 300)
    assert @role.doctors.size > 1
    assert_equal doctor1.role, doctor2.role
  end
end

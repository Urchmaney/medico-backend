# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can't create user without username" do
    user = User.new(last_name: 'Luke', first_name: 'Bloom')
    assert_not user.save
  end

  test "Can't create user without first and last name" do
    user = User.new(username: 'moon')
    assert_not user.save
  end

  test 'Can create user with first, last name and username' do
    user = User.new(username: 'moon', first_name: 'Jude', last_name: 'Lukwe')
    assert user.save
  end

  test "Can't create user with already existing username" do
    user = User.create(username: 'moon', first_name: 'Light', last_name: 'sun')
    newUser = User.new(username: 'moon', first_name: 'Lightb', last_name: 'sun')
    assert_not newUser.save
  end
end

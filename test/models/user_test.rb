require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can't create user without username" do
    user = User.new(last_name: 'Luke', first_name: 'Bloom');
    assert_not user.save
  end
  
  test "Can't create user without first and last name" do
    user = User.new(username: 'moon');
    assert_not user.save
  end
end

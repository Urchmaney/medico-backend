require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "can't create user without username" do
    user = User.create(last_name: 'Luke', first_name: 'Bloom');
    assert_not user.save
  end
  
  test "Can't create user without first and last name" do
    user = User.create(username: 'moon');
    assert_not user.save
  end
end

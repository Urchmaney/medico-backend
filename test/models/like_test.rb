# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @doctor = doctors(:one)
  end

  test 'user doctors like increase by one on like' do
    assert_difference('@user.doctors_liked.count', 1) do
      Like.create(user_id: @user.id, doctor_id: @doctor.id)
    end
  end

  test 'doctor liked_by increase by one on like' do
    assert_difference('@doctor.liked_by.count', 1) do
      Like.create(user_id: @user.id, doctor_id: @doctor.id)
    end
  end
end

# frozen_string_literal: true

class API::V1::UsersController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { token: Auth.issue(username: @user.username), user: @user },
             status: :created, location: api_v1_users_url(@user)
    else
      render json: { error: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username)
  end
end

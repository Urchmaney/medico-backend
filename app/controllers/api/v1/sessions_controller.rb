class API::V1::SessionsController < ApplicationController
  skip_before_action :authenticate
  
  def create
    user = User.find_by(username: auth_params[:username])
    result = { error: 'Incorrect details.' }
    status = 400
    if user
      jwt = Auth.issue(username: user.username)
      result = { token: jwt, user: user } 
      status = 200
    end
    render json: result , status: status
  end

  private

  def auth_params
    params.require(:auth).permit(:username)
  end
end

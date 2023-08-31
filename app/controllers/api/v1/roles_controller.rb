# frozen_string_literal: true

class API::V1::RolesController < ApplicationController
  before_action :set_role, only: %i[show update destroy]

  # GET /roles
  def index
    @roles = Role.all

    render json: @roles
  end

  # GET /roles/1
  def show
    render json: @role.doctors
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end
end

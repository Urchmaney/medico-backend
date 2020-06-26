# frozen_string_literal: true

class API::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]

  # GET /appointments
  def index
    @appointments = current_user.appointments

    render json: @appointments,
           include: { doctor: { only: %i[first_name last_name] } }
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created, location: api_v1_appointments_url(@appointment)
    else
      render json: { error: @appointment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :date, :time).merge(user_id: current_user.id)
  end
end

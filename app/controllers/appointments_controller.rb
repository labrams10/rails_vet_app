# frozen_string_literal: true

class AppointmentsController < ApplicationController
  # before_action :verify_login

  def index
    @appointments = User.find_by(id: current_user.id).appointments
  end

  def show
    @appointment = Appointment.find_by(params[:id])
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    if @appointment.save
      redirect_to user_appointments_path(current_user)
    else
      render :new
    end
  end

  def new
    @appointment = Appointment.new
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.destroy
    redirect_to user_appointments_path(current_user)
  end

private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :vet_id)
  end
end

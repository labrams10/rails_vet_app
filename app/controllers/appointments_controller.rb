class AppointmentsController < ApplicationController
  # before_action :verify_login

  def index
  end

  def display_appointment
    binding.pry
    @appointment = Appointment.find_by(params[:id])
  end
end

class AppointmentsController < ApplicationController
  # before_action :verify_login

  def index
  end

  def show
    @appointment = Appointment.find_by(params[:id])
  end
end

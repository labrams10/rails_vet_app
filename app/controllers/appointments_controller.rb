class AppointmentsController < ApplicationController
  # before_action :verify_login

  def index
    @appointments = User.find_by(id: current_user.id).appointments
  end

  def show
    @appointment = Appointment.find_by(params[:id])
  end

  def create
    current_user.appointments.build(appointment_params).save
    redirect_to user_appointments_path(current_user)
  end

  def new
    @appointment = Appointment.new
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :time, :vet_id)
  end
end

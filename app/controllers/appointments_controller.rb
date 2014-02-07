class AppointmentsController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :edit, :update, :show]
  
  def new
    @appointment = Appointment.new#(:appointment_date => (I18n.localize Date.today, :format => :default))
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client_id = current_user.id

    if @appointment.save
      flash[:success] = "Appointment created"
      redirect_to current_user
    else
      render "new"
    end
  end

  def destroy
  end


  private

  def appointment_params
    params.require(:appointment).permit(:employee_id, :category_id, :service_id, :appointment_date, :appointment_time, :paid)
  end
  
  def employee_service_params
    params[:appointment].require(:employee_services).permit(:employee_id, :service_id)
  end
end

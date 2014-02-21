class CategoriesController < ApplicationController
  def new
    @appointment = Appointment.new
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
  
  private

  def appointment_params
    params.require(:appointment).permit(:employee_id, :category_id, :service_id, :appointment_date, :appointment_time, :paid)
  end
end

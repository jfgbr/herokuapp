class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @current_user = current_user
    @appointment = Appointment.new(appointment_params)
    @appointment.client_id = @current_user.id

    if @appointment.save
      flash[:success] = "Appointment created"
      redirect_to current_user
    else
      render "new"
    end
  end
  
  def category
    @category
  end

  def destroy
  end


  private

  def appointment_params
    params.require(:appointment).permit(:employee_id, :category_id, :service_id, :appointment_date, :paid)
  end
end

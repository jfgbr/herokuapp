class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @current_user = current_user
    @appointment = Appointment.new(appointment_params)
    #@appointment.employee_service = EmployeeService.new(:employee_id => params[:employee_id])
    #@appointment.employee_service = EmployeeService.new(employee_service_params)
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
    params.require(:appointment).permit(:employees, :services, :appointment_date, :paid)
  end
  
  #def employee_service_params
  #  params.require(:appointment).permit(:employees, :services)
  #end
end

class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    #@employee = User.new
  end

  def create
    @current_user = current_user
    @category = params[:category_id]
    @appointment = Appointment.new(appointment_params)
    #@employee = @appointment.employee_service.employee_id
    #@employee = 2#params[:employees]# User.find(params[:employees]).first.id#.to_i
    
    #@appointment.employee_service = EmployeeService.new(:employee_id => params[:employee_id])
    #@appointment.build_employee_service(:employee_id => params[employee_services:[:employee_id]], :service_id => params[employee_services:[:service_id]])
    #@appointment.employee_service_id = EmployeeService.where(:employee_id => params[employee_services:[:employee_id]].to_i, :service_id => params[employee_services:[:service_id]].to_i)
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
  
  def employee_service_params
    params[:appointment].require(:employee_services).permit(:employee_id, :service_id)
  end
end

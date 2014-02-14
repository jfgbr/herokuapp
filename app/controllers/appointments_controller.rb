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


  def unavaiable_dates
    if params[:year_id] != "0"
      year = params[:year_id].to_i
    else
      year = Date.today.year
    end
    if params[:month_id] != "0"
      start_date = Date.new(year,params[:month_id].to_i,1)
    else
      start_date = Date.today.at_beginning_of_month
    end
    end_date = start_date.at_end_of_month
    appointments = Appointment.where(:employee_id => params[:employee_id], :appointment_date => start_date..end_date).order(:appointment_date,:appointment_time).collect { |m| (I18n.localize m.appointment_date, :format => :db) }
#    appointments = Appointment.where(:employee_id => params[:employee_id]).order(:appointment_date,:appointment_time)
    respond_to do |format|
      format.json { render :json => appointments }
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:employee_id, :category_id, :service_id, :appointment_date, :appointment_time, :paid)
  end

end

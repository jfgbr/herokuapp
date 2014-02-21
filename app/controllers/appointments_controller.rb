class AppointmentsController < ApplicationController
  include CategoriesHelper
  include ServicesHelper
  
  before_action :signed_in_user, only: [:index, :new, :edit, :update, :show]
  
  def new
    @appointment = Appointment.new#(:appointment_date => (I18n.localize Date.today, :format => :default))
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.client_id = current_user.id
    @appointment.appointment_date = Date.parse(params[:appointment][:appointment_date])
    @appointment.appointment_time = parse_calculator_time
    #@appointment.date = @appointment.appointment_date
    #@schedule = Schedule.new( :weekly_schedule_id => @appointment.employee.weekly_schedules.where(:workday_id => @appointment.appointment_date.wday+1).first.id,
    #                          :date => @appointment.appointment_date,
    #                          :start_time => @appointment.appointment_time,
    #                          :end_time => @appointment.appointment_time + @appointment.service.duration.minutes,
    #                          :schedule_type_id => 1)
    
    if @appointment.save 
      flash[:success] = "Appointment created"
      redirect_to current_user
    else
      render "new"
    end
  end

  def destroy
  end


  def categories
    category_for_select_by_employee(params[:employee_id])
  end
  def services
    services_by_category(params[:employee_id],params[:category_id])
  end

  def unavaiable_dates
    day = Date.today.day
    if params[:year_id] != "0"
      year = params[:year_id].to_i
    else
      year = Date.today.year
    end
    if params[:month_id] != "0"
      start_date = Date.new(year,params[:month_id].to_i,day)
    else
      start_date = Date.today#.at_beginning_of_month
    end
    end_date = start_date.at_end_of_month

    dates = User.find(params[:employee_id]).schedules.where(:date => start_date..end_date).order(:date).collect { |m| (I18n.localize m.date, :format => :db) }

    respond_to do |format|
      format.json { render :json => dates }
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:employee_id, :category_id, :service_id, :paid)
  end

  def parse_calculator_time
    Time.parse("#{params[:appointment]["appointment_time(1i)"]}-#{params[:appointment]["appointment_time(2i)"]}-#{params[:appointment]["appointment_time(3i)"]} #{params[:appointment]["appointment_time(4i)"]}:#{params[:appointment]["appointment_time(5i)"]}")
  end
end

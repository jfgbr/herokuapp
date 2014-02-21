class ServicesController < ApplicationController
  before_action :admin_user,     only: [:new, :edit, :index]
  
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      flash[:success] = "Service created"
      redirect_to services_path
    else
      render 'new'
    end
  end
  
  def edit
    @service = Service.find(params[:id])
  end
  
  def update
    if params[:cancel]
      redirect_to services_path
    else
      @service = Service.find(params[:id])
      if @service.update_attributes(service_params)
        flash[:success] = "Service updated"
        redirect_to services_path
      else
        render 'edit'
      end
    end
  end

  def index
    @services = Service.order('category_id , text ASC').paginate(page: params[:page])
  end
  
  private
    def service_params
      params.require(:service).permit(:text, :active, :price, :duration)
    end
end

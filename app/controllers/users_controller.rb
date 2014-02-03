class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:destroy]
  before_action :show_user,      only: [:show]
  
  def index
    @users = User.order('admin DESC , name ASC').paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if params[:cancel]
      redirect_to root_path
    else
      if @user.save
        sign_in @user
        flash[:success] = "Welcome!"
        redirect_to @user
      else
        render 'new'
      end
    end
  end
  
  def destroy
    @deleted_user = User.find(params[:id])
    if current_user?(@deleted_user)
      flash.now[:error] = "You can't delete yourself!"
    else
      @deleted_user.destroy
      flash[:success] = @deleted_user.name + " deleted."
    end
    redirect_to users_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if params[:cancel]
      redirect_to @user
    else
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    end
  end
  
  def employees
    employees_for_select
  end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before filters
    def correct_user?
      @user = User.find(params[:id])
      current_user?(@user)
    end
    
    def correct_user
      redirect_to(root_url) unless correct_user?
    end
    
    def show_user
      admin_user unless correct_user?
    end
end

class AdminsController < ApplicationController
  before_action :get_response, only: [:edit, :update, :destroy]
  before_action :require_user
    
  def get_response
    @admin = Admin.find(params[:id])
  end
  
  def new 
    @admin = Admin.new 
  end
  
  def create 
      @user = Admin.new(user_params) 
    if @user.save
      #sign new user in automatically
      #session[:user_id] = @user.id 
      redirect_to '/all' 
    else 
      redirect_to '/signup' 
    end 
  end
  
  def edit
  end
  
  def update
    if @admin.update_attributes(user_params)
      redirect_to all_responses_path
    else
      Rails.logger.info(@admin.errors.messages.inspect)
      render :action => 'edit'
    end
  end
    
  def destroy
    if @admin != @current_user
      @admin.destroy
      redirect_to all_responses_path
    else
      @admin.destroy
      redirect_to '/login'
    end
  end
    
  private
  def user_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

class SessionsController < ApplicationController
  
  def new 
  end
  
  def create
  @user = Admin.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_to '/all'
  else
    flash[:notice] = "Incorrect Email or Password!"
    redirect_to '/login'
  end
  end
  
  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end

end

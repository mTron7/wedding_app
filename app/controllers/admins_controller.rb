class AdminsController < ApplicationController
    before_action :get_response, only: [:edit, :update, :destroy]
    #before_action :check_auth, only: [:edit, :update, :destroy]
    
    def get_response
      @admin = Admin.find(params[:id])
    end
    
    #def check_auth
    #    if session[:zombie_id] != @tweet.zombie_id
    #        flash[:notice] = "Sorry, you do not have permission!"
    #        redirect_to tweets_path
    #    end
    #end
    
    def new 
      @admin = Admin.new 
    end
  
    def create 
      @admin = Admin.new(message_params) 
      if @admin.save 
        redirect_to '/all' 
      else 
        render 'new' 
      end 
    end
  
    def edit
    end
    
    def update
      if @admin.update_attributes(message_params)
        redirect_to all_responses_path
      else
        Rails.logger.info(@admin.errors.messages.inspect)
        render :action => 'edit'
      end
    end
    
    
    def destroy
      @admin.destroy
      redirect_to all_responses_path
    end
    
    private 
    def message_params 
      params.require(:admin).permit(:name, :email, :password) 
    end
end

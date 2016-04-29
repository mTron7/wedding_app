class ResponsesController < ApplicationController
    before_action :get_response, only: [:edit, :update, :destroy]
    #before_action :check_auth, only: [:edit, :update, :destroy]
    
    def get_response
      @response = Response.find(params[:id])
    end
    
    #def check_auth
    #    if session[:zombie_id] != @tweet.zombie_id
    #        flash[:notice] = "Sorry, you do not have permission!"
    #        redirect_to tweets_path
    #    end
    #end
    
    def home
    end
    
    
    def index
      @responses = Response.all
      @admins = Admin.all
    end
    
    def new 
      @response = Response.new 
    end
  
    def create 
      @response = Response.new(message_params) 
      if @response.save 
        redirect_to '/all' 
      else 
        render 'new' 
      end 
    end
  
    #load the edit page
    def edit
    end
    
    #accepts the details and writes to model
    def update
      if @response.update_attributes(message_params)
        redirect_to all_responses_path
      else
        Rails.logger.info(@response.errors.messages.inspect)
        render :action => 'edit'
      end
    end
    
    
    def destroy
      @response.destroy
      redirect_to all_responses_path
    end
    
    
    private 
    def message_params 
      params.require(:response).permit(:name, :attending, :comments) 
    end
end


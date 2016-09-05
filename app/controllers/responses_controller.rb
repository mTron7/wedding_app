class ResponsesController < ApplicationController
    before_action :get_response, only: [:edit, :update, :destroy]
    before_action :require_user, only: [:index, :edit, :update, :destroy]

    def wedding
      @response = Response.new
    end
    
    
    def get_response
      @response = Response.find(params[:id])
    end
    
    def home
      @response = Response.new
    end
    
    
    def index
      @responses = Response.all
      @admins = Admin.all
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"RSVP-list.csv\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end
    
    def new 
      @response = Response.new 
    end
  
    def create 
      @response = Response.new(message_params)  
      respond_to do |format|
        if @response.save
          format.html { redirect_to @response }
          format.js   {}
          format.json { render json: @response, status: :created, location: @response }
        else
          format.html { render :new }
          format.js
          format.json { render json: @response.errors, status: :unprocessable_entity }
        end
      end
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
      params.require(:response).permit(:guest1, :guest2, :attending, :comments) 
    end
end


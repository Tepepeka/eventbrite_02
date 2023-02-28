class Admin::EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
    before_action :is_admin?
  
    def index
      @events = Event.all
    end

    def show
    end
  
    def edit
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: 'Event destroy'
    end
  
    def update
      @event.update(post_params)
      redirect_to admin_events_path, notice: 'Event update'
    end
    
    #######
    private
    #######

    def set_event
        @event=event.find(params[:id])
    end

    def post_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end

    def is_admin?
        if current_user.admin? != true
          redirect_to root_path, notice: "Must be Admin"
        end
    end

end
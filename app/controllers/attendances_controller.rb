class AttendancesController < ApplicationController

    before_action :set_event

    def new

    end

    def create

        @event.attendees << current_user
        redirect_to root_path, notice: "You have registered."
    end

    def destroy

        @event.attendees.delete(current_user)
        redirect_to root_path, notice: "You have deregistered"
    end

    #######
    private
    #######

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

end
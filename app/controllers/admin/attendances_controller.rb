class Admin::AttendancesController < ApplicationController

    before_action :authenticate_user!
    before_action :is_admin?

    def index
      @users = User.all
      @events = Event.all
    end

    #######
    private
    #######

    def is_admin?
        if current_user.admin? != true
          redirect_to root_path, notice: "Must be Admin"
        end
    end
end
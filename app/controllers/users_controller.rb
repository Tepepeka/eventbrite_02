class UsersController < ApplicationController

  before_action :set_user, only: %i[ show ]

  def show

  end

 
  #######
  private
  #######

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow owner of event.
  def owner?
    unless current_user == @user
      redirect_back fallback_location: root_path, notice: 'You are not the user'
    end
  end


end
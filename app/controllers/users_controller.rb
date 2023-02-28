class UsersController < ApplicationController

  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :is_user?, only: %i[ edit update destroy ]
  
  def show

  end

  def edit
  
  end

  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "User was successfully destroyed."
  end

 
  #######
  private
  #######

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end

  # Only allow user of account.
  def is_user?
    unless current_user == @user
      redirect_back fallback_location: root_path, notice: 'You are not the user.'
    end
  end

end
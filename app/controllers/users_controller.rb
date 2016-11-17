class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
  end

  def edit
    if current_user.id == @user.id
      return
    else
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user), notice: "Sorry, something went wrong"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture,
                                 :profile_picture_cache, :phone_number, :address, :email)
  end


  def set_user
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id == @user.id
      return
    else
      redirect_to root_path
    end
  end

  def update
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user), notice: "Sorry, something went wrong"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_picture,
                                 :phone_number, :address, :email)
  end

end

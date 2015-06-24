class ProfilesController < ApplicationController



  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user


    if @user.update_attributes(user_params)
      redirect_to profiles_path, :notice => "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params[:user].permit(:first_name, :email, :phone, :password, :password_confirmation)
  end
end

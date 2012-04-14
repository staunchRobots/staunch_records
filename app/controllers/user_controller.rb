class UserController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end
end

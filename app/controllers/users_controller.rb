class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user 
      flash[:notice] = "User was successfully updated." 
    else
      render 'edit'
    end
  end

  def destroy
    if @user.orders.empty?
      @user.destroy
      redirect_to users_url
      flash[:notice] = "User was successfully destroyed." 
    else
      redirect_to users_url
      flash[:notice] = "User has orders. Cannot be destroyed."
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone)
  end
end
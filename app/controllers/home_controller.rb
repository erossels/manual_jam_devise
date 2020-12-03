class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:admin_panel, :make_admin, :remove_admin]

  def index
    @stories = Story.all
  end

  def admin_panel
    is_admin
    @users = User.all
  end

  def make_admin
    @user = User.find(params[:user_id])
    @user.admin = true
    @user.save
    flash[:notice] = "#{@user.name} is now an Admin"
    redirect_to home_admin_panel_path
  end

  def remove_admin
    @user = User.find(params[:user_id])
    @user.admin = false
    @user.save
    flash[:notice] = "#{@user.name} is no longer an Admin"
    redirect_to home_admin_panel_path
  end

  private
  def is_admin
    if current_user.admin
    else
      flash[:notice] = "You're not an Admin"
      redirect_to root_path
    end
  end

end
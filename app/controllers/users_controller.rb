class UsersController < ApplicationController
before_action :require_user_logged_in, only: [:show, :wanttodolists, :mypage, :myrecruit, :mycontracts, :myjob]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user
    else
      render :new
    end 
  end
  def edit
    @user = current_user
  end 
  def update
    @user = current_user
    @user.update(user_update_params)
    redirect_to mypage_url
  end 
  def wanttodolists
    @wanttodolists = current_user.wanttodolists
  end 
  def mypage
    @user = current_user
    @jobs = current_user.jobs.all
  end 
  def myrecruit
    @user = current_user
    @jobs = current_user.jobs.all
  end 
  def mycontracts
    @contracts = current_user.contracts.all
  end 
  def jobsasworkers
    @jobsasworkers = current_user.jobsasworkers
  end 
private

 def user_params
 params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end 
 def user_update_params
   params.require(:user).permit(:name, :myself)
 end 
end

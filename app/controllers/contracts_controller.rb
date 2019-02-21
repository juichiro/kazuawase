class ContractsController < ApplicationController
 before_action :require_user_logged_in
 def create 
   user = User.find(params[:user])
   job = Job.find(params[:job])
   current_user.approve(user, job)
  flash[:success] = '契約が完了しました'
  redirect_to mypage_url
 end
 # def create
 #   want = Want.find(params[:id])
 #   current_user.approve(want)
 #   flash[:success] = '正常に契約が完了しました'
 #   redirect_to current_user
 # end

  def destroy
   user = User.find(params[:user_id])
   job = Job.find(params[:job_id])
   current_user.disapprove(user, job)
   flash[:danger] = '契約を解除しました'
   redirect_to mypage_url
  end
end

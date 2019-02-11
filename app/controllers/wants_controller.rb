class WantsController < ApplicationController
  before_action :require_user_logged_in
  def create
    job = Job.find(params[:job_id])
    current_user.apply(job)
    flash[:success] = '正常に応募できました'
    redirect_to job
  end
  def destroy
    job = Job.find(params[:job_id])
    current_user.withdraw(job)
    flash[:success] = '正常にキャンセルしました'
    redirect_to job
  end
end

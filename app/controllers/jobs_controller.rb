class JobsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
    @wants = @job.wants
  end
  def new
    @job = current_user.jobs.build
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save 
      flash[:success] = '正常に投稿できました'
      redirect_to jobs_url
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end 
  end
  def edit
    @job = current_user.jobs.find(params[:id])
  end 

  def update
    @job = current_user.jobs.find(params[:id])

    if @job.update(job_params)
      flash[:success] = '正常に更新されました'
      redirect_to @job
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @job = current_user.jobs.find(params[:id])
    @job.destroy
    flash[:success] = '正常に削除されました'
    redirect_to jobs_url
  end
  private
  def job_params
    params.require(:job).permit(:what, :when, :place, :detail, :reward)
  end 
end

class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)

    if @job.save
      redirect_to @job, notice: 'A job was successfully saved!'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      redirect_to @job, notice: 'A job was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path, notice: 'A job was successfully deleted!'
  end

  private

  def jobs_params
    params.require(:job).permit(:title, :description, :company, :url)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end

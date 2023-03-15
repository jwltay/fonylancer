class JobsController < ApplicationController
  def index
    @jobs = Job.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :budget, :start_date, :end_date)
  end
end

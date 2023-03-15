class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    # authorize @job
    @job = Job.new
    @job.employer = current_user
  end

  def create
    # authorize @job
    @job = Job.new(job_params)
    @job.employer = current_user
    raise
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

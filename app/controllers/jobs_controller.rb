require "open-uri"

class JobsController < ApplicationController
  def index
    @jobs = policy_scope(Job).paginate(page: params[:page], per_page: 5)
  end

  def show
    @job = Job.find(params[:id])
    @bid = Bid.new
    @country_code = @job.employer.country_code
    @country = @job.employer.country
    authorize @job
    @bids = policy_scope(@job.bids)
  end

  def new
    authenticate_user!
    @job = Job.new
    @job.employer = current_user
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.employer = current_user
    authorize @job
    if @job.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authenticate_user!
    @job = Job.find(params[:id])
    authorize @job
  end

  def update
    @job = Job.find(params[:id])
    authorize @job
    @job.update!(job_params)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :budget, :start_date, :end_date, :complete)
  end
end

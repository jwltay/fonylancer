class BidsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @bids = @job.bids
  end

  def new
    @job = Job.find(params[:job_id])
    @bid = Bid.new
  end

  def create
    @job = Job.find(params[:jobs_id])
    bid = Bid.new(job: @job, user: bid_params[:user], rate: bid_params[:rate])
    if bid.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:user, :rate)
  end
end

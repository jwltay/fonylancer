class BidsController < ApplicationController
  before_action :set_job, :authenticate_user!

  def index
    @bids = @job.bids
  end

  def new
    @bid = Bid.new
  end

  def create
    bid = Bid.new(job: @job, user: current_user, rate: bid_params[:rate])
    if bid.save
      redirect_to job_path(@job)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:rate)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end

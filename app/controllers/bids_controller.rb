class BidsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @bids = @job.bids
  end

  def new
    @job = Job.find(params[:job_id])
    @bid = Bid.new
  end
end

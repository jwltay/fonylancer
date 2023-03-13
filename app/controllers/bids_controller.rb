class BidsController < ApplicationController
  def index
    @job = Job.find(params[:job_id])
    @bids = @job.bids
  end
end

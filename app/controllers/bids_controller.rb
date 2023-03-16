class BidsController < ApplicationController
  before_action :set_job, except: :update
  before_action :authenticate_user!

  def index
    if current_user == @job.employer
      @bids = @job.bids
    else
      render "Only the job owner can view bids" # move into locales in the future
    end
  end

  def new
    @bid = Bid.new
  end

  def create
    # TODO: make params into strong params
    @bid = Bid.new(job: @job, freelancer: current_user, rate: params['bid']['rate'])

    user = current_user
    user.name = params['user']['name']
    user.tagline = params['user']['tagline']
    user.description = params['user']['description']
    user.save!

    # TODO: make params into strong params user_params
    user.update_attributes(params['user'])

    if @bid.save
      flash[:notice] = "Bid submitted successfully!"
      redirect_to job_path(@job)
    else
      render 'jobs/show', status: :unprocessable_entity
    end
  end

  def update
    @bid = Bid.find(params[:id])
    @bid.accepted = true
    @bid.save!
    @job = Job.find(params[:job_id])
    redirect_to job_path(@job)
  end

  private

  def bid_params
    params.require(:bid).permit(:rate)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end

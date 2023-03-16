class BidsController < ApplicationController
  before_action :set_job, except: :update
  before_action :authenticate_user!

  # def index
  #   if current_user == @job.employer
  #     @bids = policy_scope(@job.bids)
  #   else
  #     render "Only the job owner can view bids" # move into locales in the future
  #   end
  # end

  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(bid_params)
    @bid.job = @job
    @bid.freelancer = current_user
    current_user.update(user_params)

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

  def user_params
    params.require(:user).permit(:name, :tagline, :description)
  end

  def bid_params
    params.require(:bid).permit(:rate)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end

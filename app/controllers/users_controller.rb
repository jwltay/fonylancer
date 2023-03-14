class UsersController < ApplicationController
  def index
    @freelancers = User.where(want_to_work: true)
  end

  def show
    @user = User.find(params[:id])
    @successful_bids = Bid.where(freelancer: @user, accepted: true)
  end
end

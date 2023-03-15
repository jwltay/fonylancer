class UsersController < ApplicationController
  def index
    @freelancers = policy_scope(User).paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
    @successful_bids = Bid.where(freelancer: @user, accepted: true)
  end
end

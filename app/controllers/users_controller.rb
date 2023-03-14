class UsersController < ApplicationController
  def index
    @freelancers = User.where(want_to_work: true).paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
  end
end

class UsersController < ApplicationController
  include YelpApi

  def index
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.find_neighborhood_name
    yelp
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:latitude, :longitude)
  end

  def yelp
    @bar = yelp_attributes(user_params["latitude"], user_params["longitude"], "bars")
    @restaurant = yelp_attributes(user_params["latitude"], user_params["longitude"], "restaurants")
  end
end

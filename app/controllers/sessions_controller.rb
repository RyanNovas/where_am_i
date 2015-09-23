class SessionsController < ApplicationController
  include YelpApi

  def index
    @session = Session.new
  end

  def create
    initial_session = Session.create(session_params)
    @session = initial_session.look_up_neighborhood
    yelp
    render :show
  end

  private

  def session_params
    params.require(:session).permit(:latitude, :longitude)
  end
  def yelp
    bar_result = yelp_attributes(session_params["latitude"], session_params["longitude"], "bars")
    bar_result ? @bar = bar_result.raw_data : @bar = type_doesnt_exist("bars")
    restaurant_result = yelp_attributes(session_params["latitude"], session_params["longitude"], "restaurants")
    restaurant_result ? @restaurant = restaurant_result.raw_data : @restaurant = type_doesnt_exist("restaurants")
  end
end

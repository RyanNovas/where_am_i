class SessionsController < ApplicationController
  include YelpApi

  def index
    @session = Session.new
  end

  def create
    @session = Session.create(session_params)
    @session.find_neighborhood_name
    yelp
    render :show
  end

  private
  def session_params
    params.require(:session).permit(:latitude, :longitude)
  end

  def yelp
    @bar = yelp_attributes(session_params["latitude"], session_params["longitude"], "bars")
    @restaurant = yelp_attributes(session_params["latitude"], session_params["longitude"], "restaurants")
  end
end

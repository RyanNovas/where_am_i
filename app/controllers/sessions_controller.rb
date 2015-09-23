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
    @bar = yelp_attributes(session_params["latitude"], session_params["longitude"], "bars")
    @restaurant = yelp_attributes(session_params["latitude"], session_params["longitude"], "restaurants")
  end

  def votes
    @votes = self.neighborhood.votes
  end

end

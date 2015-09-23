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
    if @bar
      @bar = @bar.raw_data
    else
      @bar = {
        "name" => "There are no bars",
        "url" => "#",
        "location" => {"coordinate" => { "latitude" => "", "longitude" => "" }}
      }
    end
    @restaurant = yelp_attributes(session_params["latitude"], session_params["longitude"], "restaurants")
    if @restaurant
      @restaurant = @restaurant.raw_data
    else
      @restaurant = {
        "name" => "There are no restaurants",
        "url" => "#",
        "location" => {"coordinate" => {"latitude" => "", "longitude" => ""}}
      }
    end
  end
end

class LocationsController < ApplicationController
  include YelpApi
  include StreetEasyApi

  def index
    @location = Location.new
  end

  def create
    initial_location = Location.create(location_params)
    @location = initial_location.look_up_neighborhood
    yelp
    avg_one_bdrm(@location)
    respond_to do |format|
      format.js { render :index }
    end
  end

  private
  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end

  def yelp
    @bar = yelp_attributes(location_params["latitude"], location_params["longitude"], "bars")
    @restaurant = yelp_attributes(location_params["latitude"], location_params["longitude"], "restaurants")
  end

end

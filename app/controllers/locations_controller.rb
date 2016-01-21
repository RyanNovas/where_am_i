class LocationsController < ApplicationController
  include YelpApi
  include StreetEasyApi

  def index
    @location = Location.new
  end

  def create
    @location = Location.create(location_params).look_up_neighborhood
    yelp ## find best food and bar restaurant within 250 feet
    avg_one_bdrm(@location) # streetEasy bdrm price lookup
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

class UsersController < ApplicationController

  include YelpApi

  def index
    @user = User.new
  end


  def create
    lat = params["user"]["latitude"]
    lon = params["user"]["longitude"]
    @user = User.create(latitude: lat, longitude: lon)
    @user.find_neighborhood_name
    @bar = yelp_attributes(lat, lon, "bars")
    @restaurant = yelp_attributes(lat, lon, "restaurants")
    render :show
  end









end

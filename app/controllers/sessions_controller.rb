class SessionsController < ApplicationController
  include YelpApi

  def index
    @session = Session.new
  end

  def create
    initial_session = Session.create(session_params)
    @session = initial_session.look_up_neighborhood
    yelp
    avg_one_bdrm
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

  def avg_one_bdrm
    rentals_end_point = "http://streeteasy.com/nyc/api/rentals/data?criteria=area:#{@session.neighborhood['name']}-#{@session.neighborhood['borough']}%7Cbeds:1&key=#{ENV["StreetEasy_key"]}&format=json"
    get_req = HTTParty.get(rentals_end_point)
    @price = get_req["average_price"]
  end
end

class User < ActiveRecord::Base
  include YelpApi

  belongs_to :neighborhood


  require 'open-uri'
  require 'json'

  attr_accessor :url, :latitude, :longitude, :neighborhood

  def find_neighborhood_name

    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{ENV["Neighborhood_key"]}"
    @response = HTTParty.get(@url)

    while @response.code != 200
      @response = HTTParty.get(@url)
    end

    neighborhood_information
    yelp_attributes
  end

  def neighborhood_information
      @neighborhood_name = @response["results"][0]["district"]
      @borough_name = @response["results"].last["district"]
      neighborhood_exists?
  end


  def neighborhood_exists?
    @neighborhood = Neighborhood.all.find_by(name: @neighborhood_name)
    @neighborhood ? set_neighborhood_id : create_neighborhood
  end

  def create_neighborhood
    @neighborhood = Neighborhood.create(name: @neighborhood_name, borough: @borough_name)
    set_neighborhood_id
  end

  def set_neighborhood_id
    self.neighborhood_id = @neighborhood.id
  end

  def yelp_attributes
    coordinates = { latitude: @latitude, longitude: @longitude }
    restaurant_params = { term: 'restaurants',
       limit: 1,
       sort: 2,
       category_filter: 'restaurants',
       radius_filter: 250
     }

    restaurant = yelp_client.search_by_coordinates(coordinates, restaurant_params)
    @restaurant_url = restaurant.businesses[0].url
    @restaurant_name = restaurant.businesses[0].name

    bar_params = { term: 'bar',
       limit: 1,
       sort: 2,
       category_filter: 'bars',
       radius_filter: 250
     }

    bar = yelp_client.search_by_coordinates(coordinates, bar_params)
    @bar_url = bar.businesses[0].url
    @bar_name = bar.businesses[0].name
  end

end

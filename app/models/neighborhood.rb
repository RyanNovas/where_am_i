class Neighborhood < ActiveRecord::Base
  has_many :users
  has_one :vote_count

  require 'open-uri'
  require 'json'

  attr_accessor :url, :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{ENV["Neighborhood_key"]}"
    neighborhood_name
  end

  def neighborhood_request
    JSON.load(open(@url))
  end

  def neighborhood_name
    neighborhood_request["results"][1]["district"]
  end

end

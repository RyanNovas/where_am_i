class Neighborhood_request
  require 'open-uri'
  require 'json'
  require 'pry'

  attr_accessor :url, :latitude, :longitude

  def initialize
    @latitude = 40.6928738
    @longitude = -73.9162731
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{Neighborhood_key}"
    neighborhood_name
  end

  def neighborhood_request
    JSON.load(open(@url))
  end

  def neighborhood_name
    puts neighborhood_request["results"][1]["district"]
  end

end

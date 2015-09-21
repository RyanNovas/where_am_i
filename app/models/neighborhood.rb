class Neighborhood < ActiveRecord::Base
  has_many :users
  has_one :vote_count

  require 'open-uri'
  require 'json'

  attr_accessor :url, :latitude, :longitude

  

  def neighborhood_request
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{ENV["Neighborhood_key"]}"
    JSON.load(open(@url))
  end

  def neighborhood_name
    neighborhood_request["results"][1]["district"]
  end

end

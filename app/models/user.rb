class User < ActiveRecord::Base
  belongs_to :neighborhood

  require 'open-uri'
  require 'json'

  attr_accessor :url, :latitude, :longitude, :neighborhood

  def find_neighborhood_name
    #Fix this with Farraday
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{ENV["Neighborhood_key"]}"
    @neighborhood_name = (JSON.load(open(@url))["results"][0]["district"])
    @borough_name = (JSON.load(open(@url))["results"].last["district"])
    neighborhood_exists? (@neighborhood_name)
  end

  def neighborhood_exists?(neighborhood_name)
    @neighborhood = Neighborhood.all.find_by(name: neighborhood_name)
    @neighborhood ? set_neighborhood_id : create_neighborhood
  end

  def create_neighborhood
    @neighborhood = Neighborhood.create(name: @neighborhood_name, borough: @borough_name)
    set_neighborhood_id
  end

  def set_neighborhood_id
    self.neighborhood_id = @neighborhood.id
  end










end

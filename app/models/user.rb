class User < ActiveRecord::Base
  belongs_to :neighborhood

  require 'open-uri'
  require 'json'

  attr_accessor :url, :latitude, :longitude, :neighborhood

  def find_neighborhood_name
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{@latitude}&lng=#{@longitude}&api-key=#{ENV["Neighborhood_key"]}"
    @neighborhood_name = (JSON.load(open(@url))["results"][0]["district"])
    neighborhood_exists? (@neighborhood_name)
  end

  #@neighborhood will persist to set_neighborhood_id or be overwritten by create_neighborhood
  def neighborhood_exists?(neighborhood_name)
    @neighborhood = Neighborhood.all.find_by(name: neighborhood_name)
    @neighborhood ? set_neighborhood_id : create_neighborhood
  end

  def create_neighborhood
    @neighborhood = Neighborhood.create(name: find_neighborhood_name)
    set_neighborhood_id
  end

  def set_neighborhood_id
    self.neighborhood_id = @neighborhood.id
    binding.pry
  end










end

class Neighborhood < ActiveRecord::Base
  has_many :sessions
  has_one :vote_count

  def self.find_neighborhood_name(latitude, longitude)
    @url = "http://api.nytimes.com/svc/politics/v2/districts.json?lat=#{latitude}&lng=#{longitude}&api-key=#{ENV["Neighborhood_key"]}"
    @response = HTTParty.get(@url)
    while @response.code != 200
      @response = HTTParty.get(@url)
    end
    neighborhood_information
  end

  def self.neighborhood_information
      @neighborhood_name = @response["results"][0]["district"]
      @borough_name = @response["results"].last["district"]
      neighborhood_exists?
  end


  def self.neighborhood_exists?
    @neighborhood = Neighborhood.all.find_by(name: @neighborhood_name)
    @neighborhood ? Session.all.last.set_neighborhood_id(@neighborhood.id) : create_neighborhood
  end

  def self.create_neighborhood
    @neighborhood = Neighborhood.create(name: @neighborhood_name, borough: @borough_name)
    Session.all.last.set_neighborhood_id(@neighborhood.id)
  end


end

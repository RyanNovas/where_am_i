class Neighborhood < ActiveRecord::Base
  include NyTimesApi
  has_many :locations
  has_one :votes


  def self.neighborhood_exists?(location, neighborhood_name, borough_name)
    @location = location
    @neighborhood_name = neighborhood_name
    @borough_name = borough_name
    @neighborhood = Neighborhood.all.find_by(name: neighborhood_name)
    @neighborhood ? @location.set_neighborhood_id(@neighborhood.id) : create_neighborhood
  end

  def self.create_neighborhood
    @neighborhood = Neighborhood.create(name: @neighborhood_name, borough: @borough_name)
    Votes.create(neighborhood_id: @neighborhood.id)
    @location.set_neighborhood_id(@neighborhood.id)
  end

end

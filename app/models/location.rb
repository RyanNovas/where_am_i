class Location < ActiveRecord::Base

  belongs_to :neighborhood

  def look_up_neighborhood
      Neighborhood.find_neighborhood_name(self, latitude, longitude)
  end


  def set_neighborhood_id(id)
    self.neighborhood_id = id
    self.save
    self
  end

end

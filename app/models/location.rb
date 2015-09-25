class Location < ActiveRecord::Base
  include NyTimesApi
  belongs_to :neighborhood

  def look_up_neighborhood
      neighborhood_query(self)
  end

  def set_neighborhood_id(id)
    self.neighborhood_id = id
    self.save
    self
  end

end

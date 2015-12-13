class Location < ActiveRecord::Base
  include GoogleApi
  belongs_to :neighborhood

  def look_up_neighborhood #looks self up google api
      neighborhood_query(self)
  end

  def set_neighborhood_id(id)
    self.update({neighborhood_id: id})
    self
  end

end

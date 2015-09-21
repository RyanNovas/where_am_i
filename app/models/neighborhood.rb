class Neighborhood < ActiveRecord::Base
  has_many :users
  has_one :vote_count

  

end

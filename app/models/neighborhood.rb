class Neighborhood < ActiveRecord::Base
  belongs_to :user
  has_one :vote_count
end

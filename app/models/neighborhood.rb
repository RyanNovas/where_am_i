class Neighborhood < ActiveRecord::Base
  has_many :sessions
  has_one :vote_count



end

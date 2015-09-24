class Votes < ActiveRecord::Base
  belongs_to :neighborhood

  def vote?(location_id, vote_type)
    location = Location.find(location_id)
    vote = false
    unless location.votes
      location.toggle(:votes)
      location.save
      vote_type == "up" ? self.up_votes +=1 : self.down_votes += 1
      self.save
      vote = true
    end
    vote
  end

end

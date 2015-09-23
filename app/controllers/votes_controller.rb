class VotesController < ApplicationController

  def create
    Vote.create(neighborhood_id)
  end

  def up_vote
    up_vote_count += 1
  end

  def down_vote
    down_vote_count -= 1
  end


end

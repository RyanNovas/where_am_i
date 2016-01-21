class VotesController < ApplicationController

  def index
    @votes = Votes.all.last
  end

  def up_vote
    @vote = Votes.all.find_by(neighborhood_id: params["neighborhood_id"])
    @upvote = @vote.vote?(params["location_id"], "up")
    respond_to do |format|
      format.js { render :upvotes }
    end
  end

  def down_vote
    @vote = Votes.all.find_by(neighborhood_id: params["neighborhood_id"])
    @downvote = @vote.vote?(params["location_id"], "down")
    respond_to do |format|
      format.js { render :downvotes }
    end
  end

end

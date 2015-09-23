class VotesController < ApplicationController

  def index
    @votes = Votes.all.last
  end

  def up_vote
    @vote = Votes.all.find_by(neighborhood_id: params["neighborhood_id"])
    @vote.up_votes +=1
    @vote.save
    respond_to do |format|
      format.js { render :upvotes }
    end
  end

  def down_vote
    @vote = Votes.all.find_by(neighborhood_id: params["neighborhood_id"])
    @vote.down_votes +=1
    @vote.save
    respond_to do |format|
      format.js { render :downvotes }
    end
  end

  def show
    render location_path()
  end



end

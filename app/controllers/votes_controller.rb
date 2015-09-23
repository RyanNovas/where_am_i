class VotesController < ApplicationController

  def index
    @votes = Votes.all.last
  end

  def up_vote
    vote = Votes.all.last
    vote.up_votes +=1
    vote.save
    redirect_to root_path
  end

  def down_vote
    vote = Votes.all.last
    vote.down_votes -=1
    vote.save
    redirect_to root_path
  end

  def show
    render session_path()
  end



end

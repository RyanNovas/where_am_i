class RemoveNumberOfVotesFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :number_of_votes, :integer
  end
end

class AddUpVotesAndDownVotesToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :up_votes, :integer
    add_column :votes, :down_votes, :integer
  end
end

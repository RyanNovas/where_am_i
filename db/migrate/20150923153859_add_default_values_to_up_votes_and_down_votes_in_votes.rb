class AddDefaultValuesToUpVotesAndDownVotesInVotes < ActiveRecord::Migration
  def change
    change_column :votes, :up_votes, :integer, default: 0
    change_column :votes, :down_votes, :integer, default: 0
  end
end

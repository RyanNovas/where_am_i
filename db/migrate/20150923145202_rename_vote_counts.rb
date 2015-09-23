class RenameVoteCounts < ActiveRecord::Migration
  def change
    rename_table :vote_counts, :votes
  end
end

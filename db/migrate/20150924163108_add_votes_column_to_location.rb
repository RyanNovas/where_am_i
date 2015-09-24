class AddVotesColumnToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :votes, :boolean, default: false
  end
end

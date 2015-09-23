class RenameSessionsTableLocations < ActiveRecord::Migration
  def change
    rename_table :sessions, :locations
  end
end

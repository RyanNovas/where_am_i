class RenameUsers < ActiveRecord::Migration
  def change
    rename_table :users, :sessions
  end
end

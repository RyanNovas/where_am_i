class ChangeLongitudeAndLatitudeInUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :latitude, :decimal, :precision => 2, :scale => 8
    change_column :users, :longitude, :decimal, :precision => 2, :scale => 8
  end
end

class ChangeLatitudeAndLongitudeToFloat < ActiveRecord::Migration
  def change
      change_column :users, :latitude, :float
      change_column :users, :longitude, :float
  end
end

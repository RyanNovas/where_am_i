class AddBoroughToNeighborhood < ActiveRecord::Migration
  def change
    add_column :neighborhoods, :borough, :string
  end
end

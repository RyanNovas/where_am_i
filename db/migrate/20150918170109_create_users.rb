class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :latitude
      t.integer :longitude

      t.timestamps null: false
    end
  end
end

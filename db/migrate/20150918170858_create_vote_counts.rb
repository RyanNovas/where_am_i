class CreateVoteCounts < ActiveRecord::Migration
  def change
    create_table :vote_counts do |t|
      t.integer :number_of_votes
      t.references :neighborhood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

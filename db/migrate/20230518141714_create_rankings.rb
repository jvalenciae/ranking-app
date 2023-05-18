class CreateRankings < ActiveRecord::Migration[7.0]
  def change
    create_table :rankings do |t|
      t.integer :month
      t.integer :year
      t.string :distance_traveled

      t.timestamps
    end
  end
end

class ChangeDistanceTraveledFromStringToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column :rankings, :distance_traveled, :integer, using: 'distance_traveled::integer'
  end
end

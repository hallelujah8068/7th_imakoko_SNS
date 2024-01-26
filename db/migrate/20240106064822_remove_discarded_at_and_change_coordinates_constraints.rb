class RemoveDiscardedAtAndChangeCoordinatesConstraints < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :discarded_at, :datetime

    # Allow null values for latitude and longitude
    change_column :posts, :latitude, :float, null: true
    change_column :posts, :longitude, :float, null: true
  end
end

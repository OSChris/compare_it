class AddLatitudeAndLongitudeToEateries < ActiveRecord::Migration
  def change
    add_column :eateries, :latitude, :float
    add_column :eateries, :longitude, :float
  end
end

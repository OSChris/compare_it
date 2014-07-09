class AddAveragesToEateries < ActiveRecord::Migration
  def change
    add_column :eateries, :average_taste, :float
    add_column :eateries, :average_price, :float
    add_column :eateries, :average_portion, :float
  end
end

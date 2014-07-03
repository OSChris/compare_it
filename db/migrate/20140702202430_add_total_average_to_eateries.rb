class AddTotalAverageToEateries < ActiveRecord::Migration
  def change
    add_column :eateries, :total_average, :float, default: 0
  end
end

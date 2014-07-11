class CreateKents < ActiveRecord::Migration
  def change
    create_table :kents do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :total_average
      t.float :latitude
      t.float :longitude
      t.float :average_taste
      t.float :average_price
      t.float :average_portion

      t.timestamps
    end
  end
end

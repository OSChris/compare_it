class CreateEateries < ActiveRecord::Migration
  def change
    create_table :eateries do |t|

      t.timestamps
    end
  end
end

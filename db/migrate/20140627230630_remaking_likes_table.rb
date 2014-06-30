class RemakingLikesTable < ActiveRecord::Migration
  def change
    drop_table :likes
  end
end

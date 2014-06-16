class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :picture, index: true
      t.references :review, index: true
      t.references :eatery, index: true

      t.timestamps
    end
  end
end

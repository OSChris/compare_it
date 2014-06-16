class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :eatery, index: true

      t.timestamps
    end
  end
end

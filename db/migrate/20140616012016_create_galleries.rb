class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :eatery, index: true

      t.timestamps
    end
  end
end

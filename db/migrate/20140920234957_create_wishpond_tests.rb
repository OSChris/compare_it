class CreateWishpondTests < ActiveRecord::Migration
  def change
    create_table :wishpond_tests do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :email

      t.timestamps
    end
  end
end

class ChangeNameFieldsInWishpondTests < ActiveRecord::Migration
  def change
  	rename_column :wishpond_tests, :first_name, "first-name"
  	rename_column :wishpond_tests, :last_name, "last-name"
  end
end

class AddRatingsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :price, :integer
    add_column :reviews, :portion, :integer
    add_column :reviews, :taste, :integer
  end
end

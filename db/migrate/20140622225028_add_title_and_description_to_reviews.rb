class AddTitleAndDescriptionToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :description, :text
  end
end

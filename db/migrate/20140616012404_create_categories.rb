class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :categorization, index: true

      t.timestamps
    end
  end
end

class AddAttributesToEatery < ActiveRecord::Migration
  def change
    add_column :eateries, :name, :string
    add_column :eateries, :address, :string
    add_column :eateries, :description, :text
  end
end

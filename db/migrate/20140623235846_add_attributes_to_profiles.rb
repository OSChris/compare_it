class AddAttributesToProfiles < ActiveRecord::Migration
  def change
    add_attachment :profiles, :avatar
    add_column :profiles, :bio, :text
  end
end

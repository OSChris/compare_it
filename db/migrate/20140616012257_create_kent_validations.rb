class CreateKentValidations < ActiveRecord::Migration
  def change
    create_table :kent_validations do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end

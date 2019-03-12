class CreateOptionAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :option_associations do |t|
      t.references :variant, foreign_key: true
      t.references :option_value, foreign_key: true

      t.timestamps
    end
  end
end

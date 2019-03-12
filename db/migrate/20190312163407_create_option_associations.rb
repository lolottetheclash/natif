class CreateOptionAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :option_associations do |t|
      t.references :variant, index: true
      t.references :option_value, index: true

      t.timestamps
    end
  end
end

class CreateOptionAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :option_associations do |t|
      t.belongs_to :variant, index: true
      t.belongs_to :option_value, index: true
      t.timestamps
    end
  end
end

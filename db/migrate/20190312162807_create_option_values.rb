class CreateOptionValues < ActiveRecord::Migration[5.2]
  def change
    create_table :option_values do |t|
      t.string :name
      t.references :option, index: true

      t.timestamps
    end
  end
end

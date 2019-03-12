class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :title
      t.references :item, foreign_key: true
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end

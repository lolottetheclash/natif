class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :title
      t.belongs_to :item, index: true
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :order, index: true
      t.references :variant, index: true
      t.references :user, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end

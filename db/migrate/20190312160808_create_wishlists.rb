class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.references :user, index: true
      t.references :variant, index: true

      t.timestamps
    end
  end
end

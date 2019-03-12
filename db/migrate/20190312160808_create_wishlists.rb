class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.belongs_to :user, index: true
      t.belongs_to :variant, index: true

      t.timestamps
    end
  end
end

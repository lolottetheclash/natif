class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :stripe_id
      t.string :address
      t.string :zipcode
      t.references :user, foreign_key: true
      t.references :delivery, foreign_key: true

      t.timestamps
    end
  end
end

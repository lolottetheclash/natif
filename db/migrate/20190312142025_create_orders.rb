class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :stripe_id
      t.string :address
      t.string :zipcode
      t.string :country, default: 'France'
      t.belongs_to :user, index: true
      t.belongs_to :delivery, index: true, default: 1
      t.timestamps
    end
  end
end

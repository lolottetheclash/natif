class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.decimal :min_price
      t.decimal :max_price

      t.timestamps
    end
  end
end

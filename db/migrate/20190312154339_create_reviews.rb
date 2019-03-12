class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :item, index: true
      t.references :user, index: true
      t.integer :rating

      t.timestamps
    end
  end
end

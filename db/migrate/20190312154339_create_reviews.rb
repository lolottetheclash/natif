class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end

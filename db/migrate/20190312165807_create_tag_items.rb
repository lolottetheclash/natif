class CreateTagItems < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_items do |t|
      t.belongs_to :tag, index: true
      t.belongs_to :taggable, polymorphic: true, index: true
      t.timestamps
    end
  end
end

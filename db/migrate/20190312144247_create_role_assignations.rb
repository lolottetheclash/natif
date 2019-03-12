class CreateRoleAssignations < ActiveRecord::Migration[5.2]
  def change
    create_table :role_assignations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true

      t.timestamps
    end
  end
end

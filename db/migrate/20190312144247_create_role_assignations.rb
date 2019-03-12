class CreateRoleAssignations < ActiveRecord::Migration[5.2]
  def change
    create_table :role_assignations do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end

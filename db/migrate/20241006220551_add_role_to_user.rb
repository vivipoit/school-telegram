class AddRoleToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, limit: 1, default: 1
  end
end

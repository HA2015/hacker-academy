class AddIndexToUsersEmail < ActiveRecord::Migration
  # Enforce email uniqueness
  def change
    add_index :users, :email, unique: true
  end
end

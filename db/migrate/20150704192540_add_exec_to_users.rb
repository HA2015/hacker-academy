class AddExecToUsers < ActiveRecord::Migration
  def change
    add_column :users, :exec, :boolean, default: false
  end
end

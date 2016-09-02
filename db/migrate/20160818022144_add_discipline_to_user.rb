class AddDisciplineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :discipline, :string
    add_column :users, :graduating, :string 
  end
end

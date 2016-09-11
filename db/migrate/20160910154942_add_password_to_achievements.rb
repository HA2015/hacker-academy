class AddPasswordToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :password, :string
  end
end

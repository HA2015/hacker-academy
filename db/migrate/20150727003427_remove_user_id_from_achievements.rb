class RemoveUserIdFromAchievements < ActiveRecord::Migration
  def change
    remove_column :achievements, :user_id
  end
end

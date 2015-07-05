class AddTeamMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :team_member, :boolean, default: false
  end
end

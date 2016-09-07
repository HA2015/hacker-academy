class AddDefaultToDescription < ActiveRecord::Migration
  def change
    change_column :users, :description, :text, default: "Welcome! Change your profile picture and your avatar by clicking Account > Edit in the topright corner"
  end
end

class AddDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :desc, :text
  end
end

class RemovePreviousStartAndEndFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :start
    remove_column :events, :end
  end
end

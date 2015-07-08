class AddStartTimeAndFinishTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :time
    add_column :events, :finish_time, :time
  end
end

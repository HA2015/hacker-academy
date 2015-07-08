class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.time :start
      t.time :end

      t.timestamps null: false
    end
  end
end

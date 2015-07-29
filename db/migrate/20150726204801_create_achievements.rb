class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.text :description
      t.integer :value
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :achievements, :users
  end
end

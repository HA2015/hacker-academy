class CreateAchieveds < ActiveRecord::Migration
  def change
    create_table :achieveds do |t|
      t.references :user, index: true
      t.references :achievement, index: true

      t.timestamps null: false
    end
    add_foreign_key :achieveds, :users
    add_foreign_key :achieveds, :achievements
  end
end

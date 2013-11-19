class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :is_private, default: false

      t.timestamps
    end
  end
end

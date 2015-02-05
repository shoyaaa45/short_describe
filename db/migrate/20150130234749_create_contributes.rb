class CreateContributes < ActiveRecord::Migration
  def change
    create_table :contributes do |t|
      t.integer :user_id
      t.string :title , null: false
      t.datetime :entry_time , null: false
      t.text :content, null: false

      t.timestamps
    end
    add_index :contributes, :user_id
  end
end


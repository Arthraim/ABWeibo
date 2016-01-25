class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :wb_sid
      t.string :wb_uid
      t.datetime :posted_at
      t.jsonb :raw, default: '{}'
    end
  end

  def up
    add_index :statuses, [:wb_sid, :wb_uid], unique: true
  end

  def down
    remove_index :statuses, [:wb_sid, :wb_uid]
  end
end

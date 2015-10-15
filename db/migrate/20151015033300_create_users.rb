class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :wb_uid
      t.string :wb_token
      t.integer :wb_expires_in
      t.integer :wb_expires_at
      t.string :wb_refresh_token

      t.timestamps null: false
    end
  end
end

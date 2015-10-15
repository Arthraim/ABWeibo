class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :wb_uid

      t.timestamps null: false
    end
  end
end

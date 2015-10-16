class AddRelationshipToUserAndTarget < ActiveRecord::Migration
  def change
    add_column :targets, :user_id, :integer, references: :users
  end
end

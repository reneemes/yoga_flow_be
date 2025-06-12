class RemoveUserFromRoutines < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :routines, :users
    remove_index :routines, :user_id
    remove_column :routines, :user_id
  end
end

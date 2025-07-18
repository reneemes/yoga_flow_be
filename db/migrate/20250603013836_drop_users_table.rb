class DropUsersTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :streak
      t.timestamps
    end
  end
end

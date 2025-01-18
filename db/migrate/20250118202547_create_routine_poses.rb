class CreateRoutinePoses < ActiveRecord::Migration[7.1]
  def change
    create_table :routine_poses do |t|
      t.references :routine, null: false, foreign_key: true
      t.references :pose, null: false, foreign_key: true

      t.timestamps
    end
  end
end

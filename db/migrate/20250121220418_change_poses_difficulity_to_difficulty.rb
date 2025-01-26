class ChangePosesDifficulityToDifficulty < ActiveRecord::Migration[7.1]
  def change
    rename_column :poses, :difficulity, :difficulty
  end
end

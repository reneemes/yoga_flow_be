class Routine < ApplicationRecord
  has_many :routine_poses
  has_many :poses, through: :routine_poses

  validates :name, :description, :difficulty, presence: true
end

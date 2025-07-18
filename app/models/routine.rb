class Routine < ApplicationRecord
  has_many :routine_poses
  has_many :poses, through: :routine_poses
  belongs_to :user

  validates :name, :description, :difficulty, presence: true
end

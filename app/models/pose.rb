class Pose < ApplicationRecord
  has_many :routine_poses
  has_many :routines, through: :routine_poses

  validates :api_id,
            :name,
            :sanskrit_name,
            :description,
            :pose_benefits,
            :translation_name,
            :image_url, presence: true
end
# frozen_string_literal: true

class RoutinePose < ApplicationRecord
  belongs_to :routine_id
  belongs_to :pose_id
end

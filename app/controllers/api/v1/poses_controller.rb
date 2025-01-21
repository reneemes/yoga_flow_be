class Api::V1::PosesController < ApplicationController
  
  def index
    poses = YogaGateway.get_poses
    # render json: poses, status: :ok
    # render json: PosesSerializer.new(poses), status: :ok
    render json: PosesSerializer.format_poses(poses), status: :ok
  end
end
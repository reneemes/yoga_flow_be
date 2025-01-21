class Api::V1::PosesController < ApplicationController
  
  def index
    poses = YogaGateway.get_poses
    render json: poses, status: :ok
  end
end
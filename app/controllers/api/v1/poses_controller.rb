class Api::V1::PosesController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error

  def index
    poses = YogaGateway.get_poses
    render json: PosesSerializer.format_poses(poses), status: :ok
  end

  def show
    id = params[:id]
    pose = YogaGateway.get_one_pose(id)
    render json: PosesSerializer.format_one_pose(pose), status: :ok
  end

  private

  def handle_standard_error
    render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." }, status: :service_unavailable
  end
end
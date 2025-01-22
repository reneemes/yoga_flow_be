class Api::V1::PosesController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error

  def index
    # begin
    poses = YogaGateway.get_poses
    render json: PosesSerializer.format_poses(poses), status: :ok
    # rescue #Faraday::Error => error
    #   render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." }, status: :service_unavailable
    # end
  end

  def show
    # begin
    id = params[:id]
    pose = YogaGateway.get_one_pose(id)
    # require 'pry'; binding.pry
    render json: PosesSerializer.format_one_pose(pose), status: :ok
    # rescue #Faraday::Error => error
    #   render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." }, status: :service_unavailable
    # end
  end

  private

  def pose_params

  end

  def handle_standard_error(error)
    # render json: ErrorSerializer.format_error(error), status: :not_found
    render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." }, status: :service_unavailable
  end
end
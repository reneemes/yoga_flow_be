class Api::V1::PosesController < ApplicationController
  # rescue_from StandardError, with: :handle_standard_error

  def index
    begin
      poses = YogaGateway.get_poses
      render json: PosesSerializer.format_poses(poses), status: :ok
    rescue => error
      render json: ErrorSerializer.format_error(error), status: :service_unavailable
    end
  end

  # def handle_standard_error(error)
  #   render json: ErrorSerializer.format_error(error), status: :not_found
  # end
end
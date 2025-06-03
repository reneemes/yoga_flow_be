class Api::V1::PosesController < ApplicationController
  skip_before_action :current_user, only: [:index, :show]
  rescue_from StandardError, with: :handle_standard_error

  def index
    file_path = Rails.root.join('public', 'data', 'all_poses.json')
    file_contents = File.read(file_path)
    json = JSON.parse(file_contents, symbolize_names: true)
    render json: PosesSerializer.format_poses(json), status: :ok
  end

  def show
    id = params[:id]
    pose = YogaGateway.get_one_pose(id)
    render json: PosesSerializer.format_one_pose(pose), status: :ok
  end

  private

  def handle_standard_error
    render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." },
    status: :service_unavailable
  end
end
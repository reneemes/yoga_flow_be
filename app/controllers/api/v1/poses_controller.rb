class Api::V1::PosesController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error
  skip_before_action :current_user

  def index
    file_path = Rails.root.join('public', 'data', 'all_poses.json')
    file_contents = File.read(file_path)
    json = JSON.parse(file_contents, symbolize_names: true)
    render json: PosesSerializer.format_poses(json), status: :ok
  end

  def show
    pose = Pose.find_by(api_id: params[:id])
    # require 'pry'; binding.pry
    render json: PosesSerializer.format_one_pose(pose), status: :ok
    # render json: { message: "Oops...", error: e.message }
  end

  private

  # def handle_standard_error
  #   render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." },
  #   status: :service_unavailable
  # end
end
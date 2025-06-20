class Api::V1::RoutinesController < ApplicationController
  # rescue_from StandardError, with: :handle_standard_error

  def index
    all_routines = Routine.all
    render json: RoutineSerializer.new(all_routines)
  end

  def show
    routine = Routine.find_by(id: params[:id])
    render json: RoutineSerializer.new(routine)
  end

  def create
    new_routine = Routine.create(routine_params)

    if new_routine.save
      handle_poses(params[:poses], new_routine)
      return render json: RoutineSerializer.new(new_routine)
    else
      return render json: {"error occurred...": error}
    end
  end

  private

  def routine_params
    params.require(:routine).permit(:name, :description, :difficulty, poses: [])
  end

  def handle_poses(api_ids, routine)
    api_ids.each do |api_id|
      pose = Pose.find_by(api_id: api_id)
      if pose
        RoutinePose.create(routine_id: routine.id, pose_id: pose.id)
      else
        Rails.logger.warn("Pose with api_id #{api_id} not found.")
      end
    end
  end

end

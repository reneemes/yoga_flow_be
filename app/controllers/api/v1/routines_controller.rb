class Api::V1::RoutinesController < ApplicationController

  def index
    all_routines = Routine.all
    render json: RoutineSerializer.new(all_routines), status: :ok
  end

  def show
    routine = Routine.find_by(id: params[:id])
    render json: RoutineSerializer.new(routine), status: :ok
  end

  def create
    new_routine = Routine.create(routine_params)

    if new_routine.save
      begin
        handle_poses(params[:poses], new_routine)
        render json: RoutineSerializer.new(new_routine), status: :created
      rescue => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    else
      render json: { error: "Routine creation was unsuccessful. Check all information is present." }, status: :bad_request
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
        raise StandardError, "Pose with api_id #{api_id} not found."
      end
    end
  end
  
end

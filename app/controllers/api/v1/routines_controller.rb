class Api::V1::RoutinesController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error

  def index
    # all_routines = Routine.where(user_id: @current_user.id)
    all_routines = Routine.all
    render json: RoutineSerializer.new(all_routines)
  end

  def show
    routine = Routine.find_by(id: params[:id])
    render json: RoutineSerializer.new(routine)
  end
end

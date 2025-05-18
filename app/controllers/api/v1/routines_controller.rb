class Api::V1::RoutinesController < ApplicationController
  rescue_from StandardError, with: :handle_standard_error

  def index
    all_routines = Routine.find_by(user_id: @current_user.id)
    render json: RoutineSerializer.new(all_routines)
  end
end

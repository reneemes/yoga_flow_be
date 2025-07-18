class ApplicationController < ActionController::API
  before_action :current_user

  def current_user
    @current_user ||= self.authenticate_user
  end

  private

  def handle_standard_error
    render json: { message: "Unable to fetch yoga poses from the Yoga API. Please try again later." },
    status: :service_unavailable
  end

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    if token
      begin
        payload = decoded_token(token)
        @current_user = User.find_by(id: payload[:user_id])
      rescue JWT::DecodeError
        @current_user = nil
      end
    end
    render json: { error: 'Not authenticated' }, status: :unauthorized unless @current_user
    return @current_user
  end

  def decoded_token(token)
    JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' })[0].symbolize_keys
  end

end

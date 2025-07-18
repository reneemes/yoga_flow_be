require "rails_helper"

describe "Sessions", type: :request do
  describe "#Create Action - Login" do
    context "Valid Request" do
      before(:each) do
        User.create!(name: "Renee", email: "renee@email.com", password: "Password")
      end

      it "should return a 200 and user information" do
        user_params = { email: "renee@email.com", password: "Password" }

        post api_v1_sessions_path, params: user_params, as: :json
        json = JSON.parse(response.body, symbolize_names: true)
        token = json[:token]
        decoded_token = JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' }).first

        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
        expect(json).to have_key(:token)
        expect(json[:user][:data][:attributes]).to include(name: "Renee", email: "renee@email.com")
        expect(json[:user][:data][:attributes]).to_not have_key(:password)
      end
    end

    context "Invalid Request" do
      it "should return a 401 and an error message" do
        user_params = { email: "email@email.com", password: "BadPassword" }

        post api_v1_sessions_path, params: user_params, as: :json
        json = JSON.parse(response.body, symbolize_names: true)
 
        expect(response).to have_http_status(:unauthorized)
        expect(json[:message]).to eq("Invalid login credentials")
        expect(json[:status]).to eq(401)
      end
    end
  end
end
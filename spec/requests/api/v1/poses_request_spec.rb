require "rails_helper"

RSpec.describe "PosesController", type: :request do
  describe "#Index Action" do
    it "Returns a serialized list of all yoga poses", :vcr do
      # get api_v1_poses_path
      get "/api/v1/poses"
      
      expect(response).to be_successful
      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)
      # require 'pry'; binding.pry
    end
  end
end
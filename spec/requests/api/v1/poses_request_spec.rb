require "rails_helper"

RSpec.describe "PosesController", type: :request do
  describe "#Index Action" do
    it "Returns a serialized list of all yoga poses", :vcr do
      get "/api/v1/poses"
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(json[0][:data][:attributes][:name]).to eq("Boat")
      expect(json[0][:data][:attributes][:sanskrit_name]).to eq("Nāvāsana")
      expect(json[5][:data][:attributes][:name]).to eq("Cat")
      expect(json[5][:data][:attributes][:sanskrit_name]).to eq("Marjaryāsana")
    end
  end


  describe "#Show Action" do
    it "Returns one pose and detailed information from the Yoga API", :vcr do
      get "/api/v1/poses/15"
      json = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:name]).to eq("Downward-Facing Dog")
      expect(json[:sanskrit_name]).to eq("Parivṛtta Adho Mukha Śvānāsana")
    end

    it "Handles not being able to fetch from the Yoga API - #Show" do
      stub_request(:get, "https://yoga-api-nzy4.onrender.com/v1/poses?id=15")
        .to_return(status: 503, body: {error: "Unable to connect to the Yoga Database."}.to_json)
    
      get "/api/v1/poses/15"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(503)
      expect(json[:message]).to eq("Unable to fetch yoga poses from the Yoga API. Please try again later.")
    end
  end
end
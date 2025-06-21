require "rails_helper"

RSpec.describe "PosesController", type: :request do
  describe "#Index Action" do
    it "Returns a serialized list of all yoga poses - #Index" do
      get "/api/v1/poses"
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(json[0][:data][:attributes][:name]).to eq("Boat")
      expect(json[0][:data][:attributes][:sanskrit_name]).to eq("Navasana")
      expect(json[5][:data][:attributes][:name]).to eq("Cat")
      expect(json[5][:data][:attributes][:sanskrit_name]).to eq("Marjaryasana")
    end
  end


  describe "#Show Action" do
    before(:each) do
      @pose = Pose.create!(
        api_id: 5,
        name: "Butterfly",
        sanskrit_name: "Baddha Konasana",
        translation_name: "baddha = bound, koṇa = angle, āsana = posture",
        description: "In sitting position, bend both knees and drop the knees to each side, opening the hips.  Bring the soles of the feet together and bring the heels as close to the groin as possible, keeping the knees close to the ground.  The hands may reach down and grasp and maneuver the feet so that the soles are facing upwards and the heels and little toes are connected.  The shoulders should be pulled back and no rounding of the spine.",
        pose_benefits: "Opens the hips and groins.  Stretches the shoulders, rib cage and back.  Stimulates the abdominal organs, lungs and heart.",
        image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483074/yoga-api/5_i64gif.svg",
        )
    end

    it "Returns one pose and detailed information - #Show" do
      get "/api/v1/poses/#{@pose.api_id}"
      json = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
   
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:name]).to eq("Butterfly")
      expect(json[:sanskrit_name]).to eq("Baddha Konasana")
    end

    it "Handles an incorrect pose ID - #Show" do  
      get "/api/v1/poses/0000"
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(503)
      expect(json[:message]).to eq("Unable to fetch yoga poses from the Yoga API. Please try again later.")
    end
  end
end
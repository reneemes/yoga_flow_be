require 'rails_helper'

RSpec.describe "Routines", type: :request do
  describe "#Index Action" do
    before(:each) do
      @user = User.create!(name: "Dolly Parton", email: "dollyP@email.com", password: "Jolene123")
      user_params = { email: @user.email, password: @user.password }
      post api_v1_sessions_path, params: user_params, as: :json
      @token = JSON.parse(response.body)["token"]
      @routine = Routine.create!(
        name: "Example Routine",
        description: "This is an example routine for getting started",
        difficulty: "Beginner",
        user_id: @user.id
      )
      @routine2 = Routine.create!(
        name: "Example Routine 2",
        description: "This is another example routine for getting started",
        difficulty: "Intermediate",
        user_id: @user.id
      )
      @pose1 = Pose.create!(
        api_id: 5,
        name: "Butterfly",
        sanskrit_name: "Baddha Konasana",
        translation_name: "baddha = bound, koṇa = angle, āsana = posture",
        description: "In sitting position, bend both knees and drop the knees to each side, opening the hips.  Bring the soles of the feet together and bring the heels as close to the groin as possible, keeping the knees close to the ground.  The hands may reach down and grasp and maneuver the feet so that the soles are facing upwards and the heels and little toes are connected.  The shoulders should be pulled back and no rounding of the spine.",
        pose_benefits: "Opens the hips and groins.  Stretches the shoulders, rib cage and back.  Stimulates the abdominal organs, lungs and heart.",
        image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483074/yoga-api/5_i64gif.svg",
        )
      @pose2 = Pose.create!(
        api_id: 10,
        name: "Child's Pose",
        sanskrit_name: "Balasana",
        translation_name: "bala = child, āsana = posture",
        description: "From a kneeling position, the toes and knees are together with most of the weight of the body resting on the heels of the feet.  The arms are extended back resting alongside the legs.  The forehead rests softly onto the earth.  The gaze is down and inward.",
        pose_benefits: "Gently stretches the hips, thighs, and ankles.  Calms the brain and helps relieve stress and fatigue.  Relieves back and neck pain when done with head and torso supported.",
        image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483079/yoga-api/10_wzpo85.svg",
      )
      RoutinePose.create!(routine_id: @routine.id, pose_id: @pose1.id)
      RoutinePose.create!(routine_id: @routine.id, pose_id: @pose2.id)
      RoutinePose.create!(routine_id: @routine2.id, pose_id: @pose1.id)
      RoutinePose.create!(routine_id: @routine2.id, pose_id: @pose2.id)
    end

    it "Returns a serialized list of all yoga routines for a user - #Index" do
      get "/api/v1/routines", headers: { "Authorization" => "Bearer #{@token}" }, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(json[0][:attributes][:name]).to eq("Example Routine")
      expect(json[0][:attributes][:routine_poses][0][:name]).to eq("Butterfly")
      expect(json[1][:attributes][:name]).to eq("Example Routine 2")
      expect(json[1][:attributes][:routine_poses][0][:name]).to eq("Butterfly")
    end
  end

  describe "#Show Action" do
    before(:each) do
      @user = User.create!(name: "Dolly Parton", email: "dollyP@email.com", password: "Jolene123")
      user_params = { email: @user.email, password: @user.password }
      post api_v1_sessions_path, params: user_params, as: :json
      @token = JSON.parse(response.body)["token"]
      @routine = Routine.create!(
        name: "Example Routine",
        description: "This is an example routine for getting started",
        difficulty: "Beginner",
        user_id: @user.id
      )
    end

    it "Returns information for one routine - #Show" do
      get "/api/v1/routines/#{@routine.id}", headers: { "Authorization" => "Bearer #{@token}" }, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(json[:name]).to eq("Example Routine")
      expect(json[:difficulty]).to eq("Beginner")
    end
  end

  describe "#Create Action" do
    before(:each) do
      @user = User.create!(name: "Dolly Parton", email: "dollyP@email.com", password: "Jolene123")
      user_params = { email: @user.email, password: @user.password }
      post api_v1_sessions_path, params: user_params, as: :json
      @token = JSON.parse(response.body)["token"]
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

    it "Creates a routine and routine poses for a specific user - #Create" do
      routine_body = {
        name: "New Routine",
        description: "This is a new routine for testing this endpoint.",
        difficulty: "Beginner",
        user_id: @user.id,
        poses: [@pose.api_id]
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json",
        "Authorization" => "Bearer #{@token}"
      }

      post "/api/v1/routines", params: routine_body.to_json, headers: headers
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(json[:data][:attributes][:name]).to eq("New Routine")
      expect(json[:data][:attributes][:difficulty]).to eq("Beginner")
    end

    it "Handles an unsuccessful routine creation (missing body) - #Create" do
      routine_body = {
        name: "",
        description: "This is a new routine for testing this endpoint.",
        difficulty: "Beginner",
        poses: [@pose.api_id]
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json",
        "Authorization" => "Bearer #{@token}"
      }

      post "/api/v1/routines", params: routine_body.to_json, headers: headers
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end

    it "Handles an unsuccessful routine creation (incorrect pose ID) - #Create" do
      routine_body = {
        name: "Beginner Flow",
        description: "This is a fun flow for all levels.",
        difficulty: "Beginner",
        poses: [000]
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json",
        "Authorization" => "Bearer #{@token}"
      }

      post "/api/v1/routines", params: routine_body.to_json, headers: headers
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
    end

    it "Handles a missing user token - #Create" do
      dolly = User.create!(name: "Dolly Dearheart", email: "dollyD@email.com", password: "Jolene123")
      pose = Pose.create!(
        api_id: 5,
        name: "Butterfly",
        sanskrit_name: "Baddha Konasana",
        translation_name: "baddha = bound, koṇa = angle, āsana = posture",
        description: "In sitting position, bend both knees and drop the knees to each side, opening the hips.  Bring the soles of the feet together and bring the heels as close to the groin as possible, keeping the knees close to the ground.  The hands may reach down and grasp and maneuver the feet so that the soles are facing upwards and the heels and little toes are connected.  The shoulders should be pulled back and no rounding of the spine.",
        pose_benefits: "Opens the hips and groins.  Stretches the shoulders, rib cage and back.  Stimulates the abdominal organs, lungs and heart.",
        image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483074/yoga-api/5_i64gif.svg",
      )
      routine_body = {
        name: "New Routine",
        description: "This is a new routine for testing this endpoint.",
        difficulty: "Beginner",
        user_id: dolly.id,
        poses: [pose.api_id]
      }
      headers = {
        "CONTENT_TYPE" => "application/json",
        "ACCEPT" => "application/json"
      }

      post "/api/v1/routines", params: routine_body.to_json, headers: headers
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(json[:error]).to eq("Not authenticated")
    end
  end
end

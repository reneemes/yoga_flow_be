# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# dolly = User.create!(name: "Dolly Parton", email: "dollyP@email.com", password: "Jolene123")
routine = Routine.create!(
  name: "Example Routine",
  description: "This is an example routine for getting started",
  difficulty: "Beginner",
  # user_id: dolly.id,
)
routine2 = Routine.create!(
  name: "Example Routine 2",
  description: "This is another example routine for getting started",
  difficulty: "Intermediate",
)
routine3 = Routine.create!(
  name: "Example Routine 3",
  description: "This is yet another example routine for getting started",
  difficulty: "Advanced",
)
pose1 = Pose.create!(
  id: 5,
  name: "Butterfly",
  sanskrit_name: "Baddha Konasana",
  translation_name: "baddha = bound, koṇa = angle, āsana = posture",
  description: "In sitting position, bend both knees and drop the knees to each side, opening the hips.  Bring the soles of the feet together and bring the heels as close to the groin as possible, keeping the knees close to the ground.  The hands may reach down and grasp and maneuver the feet so that the soles are facing upwards and the heels and little toes are connected.  The shoulders should be pulled back and no rounding of the spine.",
  pose_benefits: "Opens the hips and groins.  Stretches the shoulders, rib cage and back.  Stimulates the abdominal organs, lungs and heart.",
  image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483074/yoga-api/5_i64gif.svg",
  )
pose2 = Pose.create!(
  id: 10,
  name: "Child's Pose",
  sanskrit_name: "Balasana",
  translation_name: "bala = child, āsana = posture",
  description: "From a kneeling position, the toes and knees are together with most of the weight of the body resting on the heels of the feet.  The arms are extended back resting alongside the legs.  The forehead rests softly onto the earth.  The gaze is down and inward.",
  pose_benefits: "Gently stretches the hips, thighs, and ankles.  Calms the brain and helps relieve stress and fatigue.  Relieves back and neck pain when done with head and torso supported.",
  image_url: "https://res.cloudinary.com/dko1be2jy/image/upload/fl_sanitize/v1676483079/yoga-api/10_wzpo85.svg",
)
RoutinePose.create!(routine_id: routine.id, pose_id: pose1.id)
RoutinePose.create!(routine_id: routine.id, pose_id: pose2.id)
RoutinePose.create!(routine_id: routine2.id, pose_id: pose1.id)
RoutinePose.create!(routine_id: routine2.id, pose_id: pose2.id)
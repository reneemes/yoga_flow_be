# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

file_contents = File.read(Rails.root.join('public', 'data', 'all_poses.json')) 
pose_json = JSON.parse(file_contents, symbolize_names: true)

pose_json.each do |row|
  begin
    Pose.find_or_create_by!(
      api_id: row[:id],
      name: row[:english_name],
      sanskrit_name: row[:sanskrit_name_adapted],
      description: row[:pose_description],
      pose_benefits: row[:pose_benefits],
      translation_name: row[:translation_name],
      image_url: row[:url_svg]
    )
  rescue => error
    Rails.logger.error "Failed to create pose: #{row[:english_name]} - #{e.message}"
  end
end

class PosesSerializer
  include JSONAPI::Serializer
  # set_type :pose
  # set_id { |pose| pose[:id].to_s }

  # attributes :english_name, :sanskrit_name, :pose_description, :pose_benefits,
  #           :category, :difficulty, :translation_name, :url_svg, :url_png#, :image_url

  def self.format_poses(poses)
    poses = poses.map do |pose|
      {
        "data": {
          "id": pose[:id].to_s,
          "type": "pose",
          "attributes": {
            "name": pose[:english_name],
            "sanskrit_name": pose[:sanskrit_name],
            # "pose_description": pose[:pose_description],
            # "pose_benefits": pose[:pose_benefits],
            # "category": pose[:category],
            # "difficulty": pose[:difficulty],
            # "translation_name": pose[:translation_name],
            "image_url": pose[:url_svg]
          }
        }
      }
    end
  end
end

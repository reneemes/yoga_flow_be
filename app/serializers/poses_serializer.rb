class PosesSerializer
  include JSONAPI::Serializer

  def self.format_poses(poses)
    poses = poses.map do |pose|
      {
        "data": {
          "id": pose[:id].to_s,
          "type": "pose",
          "attributes": {
            "name": pose[:english_name],
            "sanskrit_name": pose[:sanskrit_name_adapted],
            "image_url": pose[:url_svg]
          }
        }
      }
    end
  end

  def self.format_one_pose(pose)
    {
        "data": {
          "id": pose[:id].to_s,
          "type": "pose",
          "attributes": {
            "name": pose[:name],
            "sanskrit_name": pose[:sanskrit_name],
            "pose_description": pose[:description],
            "pose_benefits": pose[:pose_benefits],
            "translation_name": pose[:translation_name],
            "image_url": pose[:image_url]
          }
        }
      }
  end
end

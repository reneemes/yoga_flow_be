class RoutineSerializer
  include JSONAPI::Serializer
  attributes :name, :description, :difficulty

  attribute :routine_poses do |routine|
    routine.routine_poses.map do |rp|
      {
        pose_id: rp.pose.id,
        name: rp.pose.name,
        sanskrit_name: rp.pose.sanskrit_name,
        translation_name: rp.pose.translation_name,
        description: rp.pose.description,
        pose_benefits: rp.pose.pose_benefits,
        image_url: rp.pose.image_url
      }
    end
  end
end

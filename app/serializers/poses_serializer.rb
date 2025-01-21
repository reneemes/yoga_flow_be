class PosesSerializer
  include JSONAPI::Serializer
  attributes :name, :sanskrit_name, :description, :pose_benefits, :category, :difficulty, :translation_name, :image_url
end

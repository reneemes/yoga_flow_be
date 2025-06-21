require 'rails_helper'

RSpec.describe Pose, type: :model do
  describe 'Associations' do    
    it { should have_many(:routine_poses) }
    it { should have_many(:routines).through(:routine_poses) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:api_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sanskrit_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:pose_benefits) }
    it { should validate_presence_of(:translation_name) }
    it { should validate_presence_of(:image_url) }
  end
end
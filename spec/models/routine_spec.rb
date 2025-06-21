require 'rails_helper'

RSpec.describe Routine, type: :model do
  describe 'Associations' do    
    it { should have_many(:routine_poses) }
    it { should have_many(:poses).through(:routine_poses) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:difficulty) }
  end
end

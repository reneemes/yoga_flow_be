require 'rails_helper'

RSpec.describe RoutinePose, type: :model do
  describe 'Associations' do    
    it { should belong_to(:routine) }
    it { should belong_to(:pose) }
  end
end

require 'rails_helper'

RSpec.describe LocationTrail, type: :model do
  describe 'relationships' do 
    it {should belong_to :location}
    it {should belong_to :trail}
  end
end

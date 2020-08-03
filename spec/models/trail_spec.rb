require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe 'relationships' do 
    it {should have_many :location_trails}
    it {should have_many(:locations).through :location_trails}
  end
end

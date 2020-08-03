require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'relationships' do 
    it {should have_many :location_trails}
    it {should have_many(:trails).through(:location_trails)}
  end
end

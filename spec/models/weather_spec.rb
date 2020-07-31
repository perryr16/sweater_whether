require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe "relationships" do 
    it { should have_many :dailies }
    it { should have_many :hourlies }
  end
  
end

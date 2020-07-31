require 'rails_helper'

RSpec.describe Pm12, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

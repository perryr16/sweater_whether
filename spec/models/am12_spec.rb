require 'rails_helper'

RSpec.describe Am12, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

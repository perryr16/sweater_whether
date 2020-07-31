require 'rails_helper'

RSpec.describe Am4, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

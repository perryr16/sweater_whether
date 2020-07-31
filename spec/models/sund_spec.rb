require 'rails_helper'

RSpec.describe Sund, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

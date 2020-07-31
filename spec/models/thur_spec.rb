require 'rails_helper'

RSpec.describe Thur, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

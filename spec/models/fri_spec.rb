require 'rails_helper'

RSpec.describe Fri, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

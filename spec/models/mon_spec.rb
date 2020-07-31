require 'rails_helper'

RSpec.describe Mon, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

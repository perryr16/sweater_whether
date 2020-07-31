require 'rails_helper'

RSpec.describe Wed, type: :model do
  describe "relationships" do 
    it {should belong_to :weather}
  end
end

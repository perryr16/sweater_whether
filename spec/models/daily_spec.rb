require 'rails_helper'

RSpec.describe Daily, type: :model do
  describe "relationships" do 
    it { should belong_to :weather }
  end
end
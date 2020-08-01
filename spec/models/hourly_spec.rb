require 'rails_helper'

RSpec.describe Hourly, type: :model do
  describe "relationships" do 
    it { should belong_to :weather }
  end
end

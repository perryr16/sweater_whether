require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe "relationships" do 
    it { should have_one :am1 }
    it { should have_one :am2 }
    it { should have_one :am3 }
    it { should have_one :am4 }
    it { should have_one :am5 }
    it { should have_one :am6 }
    it { should have_one :am7 }
    it { should have_one :am8 }
    it { should have_one :am9 }
    it { should have_one :am10 }
    it { should have_one :am11 }
    it { should have_one :am12 }
    it { should have_one :pm1 }
    it { should have_one :pm2 }
    it { should have_one :pm3 }
    it { should have_one :pm4 }
    it { should have_one :pm5 }
    it { should have_one :pm6 }
    it { should have_one :pm7 }
    it { should have_one :pm8 }
    it { should have_one :pm9 }
    it { should have_one :pm10 }
    it { should have_one :pm11 }
    it { should have_one :pm12 }
    it { should have_one :sund }
    it { should have_one :mon }    
    it { should have_one :tue }
    it { should have_one :wed }    
    it { should have_one :thur }
    it { should have_one :fri }    
    it { should have_one :sat }
  end
  
end

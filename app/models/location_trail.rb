class LocationTrail < ApplicationRecord
  belongs_to :location
  belongs_to :trail
end

class Trail < ApplicationRecord
  has_many :location_trails
  has_many :locations, through: :location_trails
end

class Location < ApplicationRecord
  has_many :location_trails
  has_many :trails, through: :location_trails
end

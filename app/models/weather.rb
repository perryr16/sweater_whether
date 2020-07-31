class Weather < ApplicationRecord
  has_many :dailies
  has_many :hourlies
end


require 'rails_helper'

describe "trail results" do
  before :each do 
    location = 'denver,co'
    trail_results = TrailResults.new(location)
    trail_results.create_trail_objects
  end
  it "returns trail and location based on city" do

    location = Location.find_by(name: 'denver,co')

    expect(location.name).to eq('denver,co')
    expect(location.forecast_summary.present?).to be true
    expect(location.forecast_temp.present?).to be true
    expect(location.forecast_temp.to_i).to_not eq(0) unless location.forecast_temp == '0'

    expect(location.trails.length > 0).to be true
    exp_difficulty = ['black', 'blue', 'green', 'blueBlack', 'doubleBlack', 'greenBlue']

    location.trails.each do |trail|
      expect(trail.name.present?).to be true
      expect(trail.summary.present?).to be true
      expect(trail.difficulty.present?).to be true
      expect(exp_difficulty.include?(trail.difficulty)).to be true
      expect(trail.location.present?).to be true
      expect(trail.distance_to_trail.present?).to be true
      expect(trail.distance_to_trail.to_i).to_not eq(0) unless trail.distance_to_trail == '0'
    end
  end

  it "returns different data for different locations" do
    denver = Location.last

    location = 'denver,co'
    trail_results = TrailResults.new(location)
    trail_results.create_trail_objects

    denver2 = Location.last

    location = 'portland,me'
    trail_results = TrailResults.new(location)
    trail_results.create_trail_objects

    portland = Location.last 

    expect(denver.name).to eq(denver2.name)
    expect(denver.name).to_not eq(portland.name) 
    expect(denver.trails[0].name).to eq(denver2.trails[0].name)
    expect(denver.trails[0].name).to_not eq(portland.trails[0].name)
    
  end
  
end
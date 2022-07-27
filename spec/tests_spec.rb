require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Exhibit do
  let(:exhibit) {described_class.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1) {Patron.new("Bob", 20)}
  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}
  let(:patron_2) {Patron.new("Sally", 20)}

  describe 'Iteration 1 tests' do
  it 'is an instance of exhibit' do
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  it 'has a name' do
    expect(exhibit.name).to eq "Gems and Minerals"
  end

  it 'has a cost' do
    expect(exhibit.cost).to eq 0
  end

  it 'has patrons' do
    expect(patron_1).to be_an_instance_of(Patron)
  end

  it 'patron has a name' do
    expect(patron_1.name).to eq "Bob"
  end

  it 'patron has spending money' do
    expect(patron_1.spending_money).to eq 20
  end

  it 'patron has no interests by default' do
    expect(patron_1.interests).to eq []
  end

  it 'patron can add interests' do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    expect(patron_1.interests).to eq ["Dead Sea Scrolls", "Gems and Minerals"]
  end
end

  describe 'Iteration 2 tests' do

    it 'has an instance of museum' do
      expect(dmns).to be_an_instance_of Museum
    end
    
    it 'museum has a name' do
      expect(dmns.name).to eq "Denver Museum of Nature and Science"
    end

    it 'museum exibits are empty by default' do
      expect(dmns.exhibits).to eq []
    end

    it 'museum can add exhibits' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      
      expect(dmns.exhibits).to eq [gems_and_minerals, dead_sea_scrolls, imax]
    end

    it 'museum can have recommendations' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      patron_1.add_interest("Gems and Minerals")
      patron_1.add_interest("Dead Sea Scrolls")
      
      patron_2.add_interest("IMAX")

      expect(dmns.recommend_exhibit(patron_1)).to eq [gems_and_minerals, dead_sea_scrolls]
      expect(dmns.recommend_exhibit(patron_2)).to eq [imax]
    end
  end
  
end
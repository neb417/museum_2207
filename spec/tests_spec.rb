require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe do
  let(:exhibit) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
  let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
  let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}

  let(:patron_1) {Patron.new("Bob", 20)}
  let(:patron_2) {Patron.new("Sally", 20)}
  let(:patron_3) {Patron.new("Johnny", 5)}

  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

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

  describe 'Iteration 3 tests' do
    it 'museum has no patrons by default and can add patrons' do
      expect(dmns.patrons).to eq []

      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      expect(dmns.patrons).to eq [patron_1, patron_2, patron_3]
    end

    it 'can sort patrons by interest' do
      dmns.admit(patron_1)
      dmns.admit(patron_2)
      dmns.admit(patron_3)

      patron_1.add_interest("Gems and Minerals")
      patron_2.add_interest("Dead Sea Scrolls")
      patron_3.add_interest("Dead Sea Scrolls")

      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)

      expect(dmns.patrons_by_exhibit_interest).to eq ({gems_and_minerals: [patron_1], dead_sea_scrolls => [patron_2, patron_3], imax => []})
    end

    xit 'can have lottery contestants by interest' do
      expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq [patron_1, patron_3]
      # expect(dmns.draw_lottery_winner(dead_sea_scrolls)).to eq "Johnny" || "Bob"
      # expect(dmns.draw_lottery_winner(gems_and_minerals)).to eq nil
      # expect(dmns.announce_lottery_winner(imax)).to eq "Bob has won the IMAX edhibit lottery"
      # expect(dmns.announce_lottery_winner(gems_and_minerals)).to eq "No winners for this lottery"
    end
  end
  
end
require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  let(:exhibit) {described_class.new({name: "Gems and Minerals", cost: 0})}
  let(:patron_1) {Patron.new("Bob", 20)}
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
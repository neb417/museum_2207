require './lib/exhibit'
require './lib/patron'

RSpec.describe Exhibit do
  let(:exhibit) {described_class.new({name: "Gems and Minerals", cost: 0})}

  it 'is an instance of exhibit' do
    expect(exhibit).to be_an_instance_of(Exhibit)
  end

  xit 'has a name' do
    expect(exhibit.name).to eq "Gems and Minerals"
  end

  xit 'has a cost' do
    expect(exhibit.cost).to eq 0
  end
  
end
require 'plane'

describe Plane do

  it {is_expected.to respond_to(:flying)}
  subject(:plane){described_class.new}

  it 'shows the plane as flying after taking off' do
    expect(plane.taking_off).to eq(plane.flying)
  end

  it 'shows when the plane is landed' do
    expect(plane.landing).to eq(plane.flying)
  end

end

require 'airport'

describe Airport do
  let(:plane) {double(:plane, :flying => true)}
  let(:weather){double(:weather, :stormy? => false)}
  let(:bad_airport){ Airport.new(weather)} #subject(:bad_airport) {described_class.new}?
  subject(:airport) {described_class.new(weather)}

  it 'allows planes to land' do
    expect(airport.land(plane)).to eq([plane])
  end

  it 'allows planes to takeoff' do
    airport.land(plane)
    expect(airport.takeoff(plane)).to eq(plane)
  end

  describe '#land' do
    it 'prevents planes landing when airport is full' do
      10.times{airport.land(Plane.new)}
      expect{airport.land(plane)}.to raise_error("This airport is full")
    end
    let(:plane2) {double(:plane2, :flying => false)}
    it 'prevents landed planes from landing again' do

      expect{airport.land(plane2)}.to raise_error("This plane is landed")
    end
  end

  let(:plane1){double(:plane1, :flying => true)}
  it "prevents landing when stormy" do
    allow(weather).to receive(:stormy?) {true}
    expect{airport.land(plane)}.to raise_error("It is stormy")
  end

  it "prevents takeoff when stormy" do
    airport.land(plane)
    allow(weather).to receive(:stormy?) {true}
    expect{airport.takeoff(plane)}.to raise_error("It is stormy")
  end

  describe '#takeoff' do
    it 'only allow planes at the airport to takeoff' do
      airport.land(plane)
      expect(bad_airport.takeoff(plane)).to be nil
      expect(airport.planes.last).to eq(airport.takeoff(plane))
    end

    it 'does not allow flying planes to takeoff' do
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.takeoff(plane)).to eq nil
    end

    it 'makes sure the plane has left the airport' do
      airport.land(plane)
      expect(airport.takeoff(plane)).not_to eq (:planes)
    end
  end

  it 'does not store flying planes' do
    airport.land(plane)
    expect(airport.takeoff(plane)).not_to eq(airport.takeoff(plane))
  end

  it 'has a default capacity' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'capacity can be overridden' do
    expect(airport.new_capacity = 40).to eq(airport.capacity)
  end
end

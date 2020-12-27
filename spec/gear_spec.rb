require_relative '../lib/gear'

RSpec.describe Gear do
  let!(:wheel) { Wheel.new(26, 1.5) }
  context 'wheel class' do
    it 'circumference' do
      expect(wheel.circumference).to be(91.106186954104)
    end
  end
  context 'gear class' do
    it 'gear_inches' do
      expect(Gear.new(52, 11, wheel).gear_inches).to be(137.0909090909091)
    end

    it 'ratio without wheel' do
      expect(Gear.new(52, 11).ratio).to be(4.7272727272727275)
    end
  end
end
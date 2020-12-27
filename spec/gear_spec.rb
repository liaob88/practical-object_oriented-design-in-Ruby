require_relative '../lib/gear'

RSpec.describe Gear do
  let!(:wheel) { Wheel.new(26, 1.5) }
  context 'wheel class' do
    it 'circumference' do
      expect(wheel.circumference).to be(91.106186954104)
    end
  end
  context 'gear class' do
    describe 'initialize method' do
      it 'when :chainring is not provided, the value of @chainring is 40, which is the dafault value of @chainring' do
        gear = Gear.new(:cog => 18, :wheel => wheel)
        expect(gear.chainring).to be(40)
      end

      it 'when :chainring is nil, the value of @chainring is nil' do
        gear = Gear.new(:chainring => nil, :cog => 18, :wheel => wheel)
        expect(gear.chainring).to be nil
      end

      it 'when :cog is not provided, the value of @cog is 18, which is the dafault value of @chainring' do
        gear = Gear.new(:chainring => 52, :wheel => wheel)
        expect(gear.cog).to be 18
      end

      it 'when :cog is nil, the value of @cog is nil' do
        gear = Gear.new(:chainring => 52, :cog => nil, :wheel => wheel)
        expect(gear.cog).to be nil
      end
    end
    
    it 'be able to get ratio without wheel and order dependency' do
      expect(Gear.new(:cog => 11, :chainring => 52).ratio).to be(4.7272727272727275)
    end
  end
end
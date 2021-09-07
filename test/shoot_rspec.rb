require 'rspec'
require '../classes/shoot.rb'

describe Shoot do
  describe ".get_type" do
    it 'Returns strike type ' do
      strike = {:first_shoot => 10, :second_shoot => 0}
      expect(Shoot.get_type(strike)).to eq :strike
    end

    it 'Es un spare' do
      spare = {:first_shoot => 8, :second_shoot => 2}
      expect(Shoot.get_type(spare)).to eq :spare
    end

    it 'Es un abierto' do
      normal = {:first_shoot => 3, :second_shoot => 3}
      expect(Shoot.get_type(normal)).to eq :normal
    end
  end
end

require 'rspec'
require '../classes/shoot.rb'

describe Shoot do
    describe ".get_type" do
        it 'Returns strike type' do
          strike = {:first_shoot => 10, :second_shoot => 0}
          expect(Shoot.is_strike?(strike)).to eq true
        end

        it 'Returns spare type' do
          spare = {:first_shoot => 8, :second_shoot => 2}
          expect(Shoot.is_spare?(spare)).to eq true
        end

         it 'Returns normal type' do
          normal = {:first_shoot => 5, :second_shoot => 3}
          expect(Shoot.is_normal?(normal)).to eq true
        end
    end
end
$LOAD_PATH << File.dirname(__FILE__)
require 'numer0n'

describe 'judge' do
  let(:number) { ['6', '0', '2'] }

  subject { judge(number, call) }

  context '1EAT-1BITE' do
    let!(:call) { ['0', '3', '2'] }

    it { should == [1, 1] }
  end

  context '3EAT' do
    let!(:call) { ['6', '0', '2'] }

    it { should == [3, 0] }
  end
end

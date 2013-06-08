$LOAD_PATH << File.dirname(__FILE__)
require 'numer0n'

describe Numer0n do
  let(:numer0n) { Numer0n.new }

  describe 'judge' do
    before  { numer0n.number = %w(6, 0, 2) }
    subject { numer0n.judge(call) }

    context '1EAT-1BITE' do
      let!(:call) { %w(0, 3, 2) }

      it { should == [1, 1] }
    end

    context '3EAT' do
      let!(:call) { %w(6, 0, 2) }

      it { should == [3, 0] }
    end
  end
end

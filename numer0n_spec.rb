$LOAD_PATH << File.dirname(__FILE__)
require 'numer0n'

describe Numer0n do
  let(:numer0n) { Numer0n.new(%w(6, 0, 2)) }

  before { numer0n.judge(call) }

  context '1EAT-1BITE' do
    let!(:call) { %w(0, 3, 2) }

    specify { numer0n.display_result.should == '1EAT-1BITE' }
  end

  context '3EAT' do
    let!(:call) { %w(6, 0, 2) }

    specify { numer0n.display_result.should == '3EAT-0BITE' }
  end
end

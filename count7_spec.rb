$LOAD_PATH << File.dirname(__FILE__)
require 'count7'

describe 'calculate' do
  specify do
    calculate('8').should  == 1
    calculate('18').should == 2
    calculate('88').should == 18
  end
end

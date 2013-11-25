$LOAD_PATH << File.dirname(__FILE__)
require 'next_prime'

describe 'next_prime' do
  specify do
    next_prime(10).should == 11
    next_prime(11).should == 13
    next_prime(44).should == 47
  end
end

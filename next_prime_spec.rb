$LOAD_PATH << File.dirname(__FILE__)
require 'next_prime'

describe 'next_prime' do
  specify do
    next_prime(10).should == 11
    next_prime(11).should == 13
    next_prime(44).should == 47
    next_prime(0).should  == 2
  end
end

describe 'prime?' do
  specify do
    prime?(-3).should be_false
    prime?(1).should  be_false
    prime?(2).should  be_true
  end
end

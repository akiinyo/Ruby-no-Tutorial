$LOAD_PATH << File.dirname(__FILE__)
require 'count7'

describe 'calculate' do
  specify do
    calculate('8').should   == 1
    calculate('18').should  == 2
    calculate('88').should  == 18
  end

  specify '1の位と10の位だけがカウントされていること' do
    calculate('699').should == 133
    calculate('700').should == 133
  end
end

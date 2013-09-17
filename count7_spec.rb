$LOAD_PATH << File.dirname(__FILE__)
require 'count7'

describe 'count7' do
  specify do
    count7('8').should  == 1
    count7('18').should == 2
    count7('88').should == 18
  end

  specify '1の位と10の位だけがカウントされていること' do
    count7('699').should == 133
    count7('700').should == 133
  end
end

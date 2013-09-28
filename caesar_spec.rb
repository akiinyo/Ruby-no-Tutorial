$LOAD_PATH << File.dirname(__FILE__)
require 'caesar'

describe '#convert' do
  let(:caesar) { Caesar.new(',igglwm') }

  specify do
    caesar.convert('aki').should == 'akiinyo'
  end
end

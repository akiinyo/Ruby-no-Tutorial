$LOAD_PATH << File.dirname(__FILE__)
require 'baseball'
require 'stringio'

describe 'baseball' do
  specify do
    score = StringIO.new("1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2\n1\n2")
    top_point, bottom_point = play_game(score)

    top_point.should == [1, 1, 1, 1, 1, 1, 1, 1, 1]
    bottom_point.should == [2, 2, 2, 2, 2, 2, 2, 2, 2]
  end
end


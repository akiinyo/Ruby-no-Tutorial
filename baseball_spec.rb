$LOAD_PATH << File.dirname(__FILE__)
require 'baseball'

describe 'baseball' do
  let!(:score) { [1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2] }

  specify do
    top_point, bottom_point = play_game(score)

    top_point.should == 9
    bottom_point.should == 18
  end
end


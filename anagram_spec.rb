$LOAD_PATH << File.dirname(__FILE__)
require 'anagram'

describe 'anagram' do
  specify { anagram?('canoe', 'ocean').should be_true }
  specify { anagram?('canoe', 'canon').should be_false }
end

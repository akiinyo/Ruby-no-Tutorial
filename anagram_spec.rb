$LOAD_PATH << File.dirname(__FILE__)
require 'anagram'

describe 'anagram' do
  let(:word_1) { 'canoe' }
  let(:word_2) { 'ocean' }
  let(:word_3) { 'canon' }

  specify { anagram_check(word_1, word_2).should be_true }
  specify { anagram_check(word_1, word_3).should be_false }
end

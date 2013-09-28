$LOAD_PATH << File.dirname(__FILE__)
require 'caesar'

describe '#convert' do
  context '正しく解読できる場合' do
    let(:caesar) { Caesar.new(',igglwm') }

    specify do
      caesar.convert('aki').should == 'akiinyo'
    end
  end

  context '暗号文に、変換できない文字が含まれている場合' do
    let(:caesar) { Caesar.new(';@*&#$!?~+=|') }

    specify do
      caesar.convert('aki').should == '解読失敗！変換できない文字が含まれています。'
    end
  end

  context '指定された文字列が、変換後の文章に含まれていない場合' do
    let(:caesar) { Caesar.new('abcdefg') }

    specify do
      caesar.convert('aki').should == '解読失敗！「aki」は含まれていません。'
    end
  end
end

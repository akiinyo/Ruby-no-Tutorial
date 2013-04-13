def anagram?(word_1, word_2)
  word_1.chars.sort == word_2.chars.sort
end

if $0 == __FILE__
  word_1, word_2 = ARGV[0], ARGV[1]

  if ARGV.size == 2

    if anagram?(word_1, word_2)
      puts 'アナグラム'
    else
      puts 'アナグラムでない'
    end

  else
    puts '引数は2つです。正しく入力してください。'
  end
end

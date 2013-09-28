class Caesar
  attr_reader :shift_count
  CHARACTER_SET = 'abcdefghijklmnopqrstuvwxyz.,-'.split(//)

  def initialize(ciphertext)
    @ciphertext  = ciphertext
    @shift_count = 0
  end

  def convert(hint)
    return '解読失敗！変換できない文字が含まれています。' unless can_convert?

    if find_key_by(hint) > 1
      return message
    else
      return "解読失敗！「#{hint}」は含まれていません。"
    end
  end

  def find_key_by(hint)
    CHARACTER_SET.size.times do
      if message.include?(hint)
        break
      end
      @shift_count += 1
    end

    if @shift_count >= CHARACTER_SET.size
      -1
    else
      @shift_count
    end
  end

  def message
    @ciphertext.each_char.with_index.map do |char|
      shift(char)
    end.join('')
  end

  def shift(char)
    return char if char == ' '

    CHARACTER_SET[CHARACTER_SET.index(char) + @shift_count] ||
    CHARACTER_SET[(CHARACTER_SET.index(char) + @shift_count) - CHARACTER_SET.size]
  end

  def can_convert?
    @ciphertext.delete(' ').split(//).uniq.all? {|char| CHARACTER_SET.include?(char) }
  end
end

if $0 == __FILE__
  ciphertext = 'ygixurqiuaidq-giy z b z cakiuitczbiotuowqza iyqzitczbiyqjimxxibtqiotuowqzaim-qivcabimxuwqkimzpimxxibtqiyqzim-qivcabimxuwqjimzpkiuzio zaq,cqzoqkiuimyimixubbxqin -qpjincbiurig cibmyqiyqkiubieuxxinqimaiuribtqiacziomyqib iatuzqi ziygixurqjiuiatmxxiwz eibtqia czpi rimiabq.ibtmbieuxxinqipurrq-qzbir- yimxxibtqi btq-aji btq-iabq.aiaqzpiyqitc--guzsinmowiczpq-zqmbtibtqis- czpjig c-aieuxxiomxxiyqkixuwqiycauoki cbi riyginc-- ej'

  caesar = Caesar.new(ciphertext)
  puts caesar.convert('shine')
end

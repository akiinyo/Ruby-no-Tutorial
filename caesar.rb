class Caesar
  attr_reader :shift_count
  CHARACTER_SET = 'abcdefghijklmnopqrstuvwxyz.,-'.split(//)

  def initialize(ciphertext)
    @ciphertext  = ciphertext
    @shift_count = 0
  end

  def decipher_by(hint)
    raise StandardError, '解読失敗！変換できない文字が含まれています。' unless can_convert?
    raise StandardError, "解読失敗！「#{hint}」は含まれていません。"    unless find_key_by(hint) > 1

    message
  end

  def find_key_by(hint)
    CHARACTER_SET.size.times do
      if message.include?(hint)
        break
      end
      @shift_count += 1
    end

    if @shift_count < CHARACTER_SET.size
      @shift_count
    else
      -1
    end
  end

  def message
    @ciphertext.each_char.with_index.map do |char|
      shift(char)
    end.join('')
  end

  def shift(char)
    return char if char == ' '

    shifted_index = CHARACTER_SET.index(char) + @shift_count
    CHARACTER_SET[shifted_index] || CHARACTER_SET[shifted_index - CHARACTER_SET.size]
  end

  def can_convert?
    @ciphertext.delete(' ').split(//).uniq.all? {|char| CHARACTER_SET.include?(char) }
  end
end

if $0 == __FILE__
  ciphertext = 'ygixurqiuaidq-giy z b z cakiuitczbiotuowqza iyqzitczbiyqjimxxibtqiotuowqzaim-qivcabimxuwqkimzpimxxibtqiyqzim-qivcabimxuwqjimzpkiuzio zaq,cqzoqkiuimyimixubbxqin -qpjincbiurig cibmyqiyqkiubieuxxinqimaiuribtqiacziomyqib iatuzqi ziygixurqjiuiatmxxiwz eibtqia czpi rimiabq.ibtmbieuxxinqipurrq-qzbir- yimxxibtqi btq-aji btq-iabq.aiaqzpiyqitc--guzsinmowiczpq-zqmbtibtqis- czpjig c-aieuxxiomxxiyqkixuwqiycauoki cbi riyginc-- ej'

  caesar = Caesar.new(ciphertext)
  begin
    puts caesar.decipher_by('shine')
  rescue StandardError => e
    puts e.message
  end
end

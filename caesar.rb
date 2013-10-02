class Caesar
  CHARACTER_SET = 'abcdefghijklmnopqrstuvwxyz .,-'.split(//)

  def initialize(ciphertext)
    @ciphertext  = ciphertext
    @shift_count = 0
  end

  def decipher_by(hint)
    raise StandardError, '解読失敗！変換できない文字が含まれています。' unless can_convert?
    find_key_by(hint)
    raise StandardError, "解読失敗！「#{hint}」は含まれていません。"    unless include_hint?

    message
  end

  def find_key_by(hint)
    CHARACTER_SET.size.times do
      if message.include?(hint)
        break
      end
      @shift_count += 1
    end
  end

  def message
    @ciphertext.each_char.map {|char| shift(char) }.join('')
  end

  def shift(char)
    shifted_index = CHARACTER_SET.index(char) + @shift_count

    CHARACTER_SET[shifted_index] || CHARACTER_SET[shifted_index - CHARACTER_SET.size]
  end

  def can_convert?
    @ciphertext.split(//).uniq.all? {|char| CHARACTER_SET.include?(char) }
  end

  private

  def include_hint?
    @shift_count < CHARACTER_SET.size
  end
end

if $0 == __FILE__
  ciphertext = File.read('cipher.txt').chomp

  caesar = Caesar.new(ciphertext)
  begin
    puts caesar.decipher_by('shine')
  rescue StandardError => e
    puts e.message
  end
end

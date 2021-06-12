require_relative 'key'
require_relative 'offset'

class Encryption

  def initialize (text, key = 'none', date = 'none')
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def ceo
    shift = create_shift
    shift = reduce_shift(shift)
    split_text
  end

  def create_shift
    @key.create_shift_key.map.with_index do |key, index|
      key + @offset.create_shift_offset[index]
    end
  end

  def reduce_shift(shift)
    shift.map do |num|
      until num < 27
        num -= 27
      end
      num
    end
  end

  def split_text
    @text = @text.split('')
  end

  def encrypt_character(char, shift)
    alphabet = (('a'..'z').to_a).push(' ')
    if alphabet.include?(char)
      alphabet[alphabet.find_index(char) + shift]
    else
      char
    end
  end
end

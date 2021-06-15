require_relative 'key'
require_relative 'offset'

class Decryption

  def initialize (text, key, date, shift = [])
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
    @shift = shift
  end

  def run_cracked_decryption
    key_shift = find_key_shift
    @key.convert_key_shift(key_shift)
    run_decryption
  end

  def run_decryption
    create_shift
    reduce_shift
    text_array = split_text
    decrypted_text = decrypt_text(text_array)
    decrypted_text = format_text(decrypted_text)
    create_output_hash(decrypted_text)
  end

  def create_shift
    @shift = @key.create_shift_key.map.with_index do |key, index|
      key + @offset.create_shift_offset[index]
    end
  end

  def reduce_shift
    @shift = @shift.map do |num|
      until num < 27
        num -= 27
      end
      num
    end
  end

  def split_text
    @text.split('')
  end

  def decrypt_text(text_array)
    shifter = @shift
    output = []
    text_array.each do |char|
      output << decrypt_character(char, shifter[0])
      shifter = shifter.rotate(1)
    end
    output
  end

  def decrypt_character(char, shifter)
    alphabet = (('a'..'z').to_a).push(' ')
    if alphabet.include?(char)
      alphabet = alphabet.rotate(alphabet.find_index(char) + 1)
      alphabet[-shifter - 1]
    else
      char
    end
  end

  def format_text(decrypted_array)
    decrypted_array.join('')
  end

  def create_output_hash(decrypted_text)
    {
      decryption: decrypted_text,
      key: @key.key,
      date: @offset.date
    }
  end

  def find_key_shift
    output = []
    @shift.each.with_index do |num, index|
      shift = num - @offset.create_shift_offset[index]
      if shift < 0
        shift = shift + 27
      end
      output << shift
    end
    output
  end
end

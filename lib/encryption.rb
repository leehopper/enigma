require_relative 'key'
require_relative 'offset'

class Encryption

  def initialize (text, key, date)
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def run_encryption
    shift = create_shift
    shift = reduce_shift(shift)
    split_text = split_and_downcase_text
    encrypted_text = encrypt_text(shift, split_text)
    encrypted_text = format_text(encrypted_text)
    create_output_hash(encrypted_text)
  end

  def create_shift
    @key.create_shift_key.map.with_index do |key, index|
      key + @offset.create_shift_offset[index]
    end
  end

  def reduce_shift(shift) # could use % of 27 to get the remainder
    shift.map do |num|
      until num < 27
        num -= 27
      end
      num
    end
  end

  def split_and_downcase_text
    temp_text = @text.split('') #.chars
    temp_text.map do |char|
      char.downcase
    end
  end

  def encrypt_text(shift, split_text)
    shifter = shift
    output = []
    split_text.each do |char|
      output << encrypt_character(char, shifter[0])
      shifter = shifter.rotate(1)
    end
    output
  end
# for module turn variance between encrypt and decrypt into parameter 
  def encrypt_character(char, shift)
    alphabet = (('a'..'z').to_a).push(' ')
    if alphabet.include?(char)
      alphabet = alphabet.rotate(alphabet.find_index(char))
      alphabet[shift]
    else
      char
    end
  end

  def format_text(encrypted_array)
    encrypted_array.join('')
  end

  def create_output_hash(encrypted_text)
    {
      encryption: encrypted_text,
      key: @key.key,
      date: @offset.date
    }
  end
end

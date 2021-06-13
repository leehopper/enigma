class Decryption

  def initialize (text, key, date)
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

  def run_decryption
    shift = create_shift
    shift = reduce_shift(shift)
    text_array = split_text
    decrypted_text = encrypt_text(shift, text_array)
    decrypted_text = format_text(decrypted_text)
    create_output_hash(decrypted_text)
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
    @text.split('')
  end

  def decrypt_text(shift, text_array)
    shifter = shift
    output = []
    text_array.each do |char|
      output << decrypt_character(char, shifter[0])
      shifter = shifter.rotate(1)
    end
    output
  end

  def decrypt_character(char, shift)
    alphabet = (('a'..'z').to_a).push(' ')
    if alphabet.include?(char)
      alphabet = alphabet.rotate(alphabet.find_index(char) + 1)
      alphabet[-shift - 1]
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
end

class Crack

  def initialize(text)
    @text = text.chomp
  end

  def crack_enigma
    split_array = split_text
    end_array = create_end_array(split_array)
    shift = create_shift(end_array)
    shift = rotate_shift(split_text, shift)
    shift
  end

  def split_text
    @text.split('')
  end

  def create_end_array(split_array)
    split_array = split_array
    temp_array = split_array.push(:end)
    end_index = temp_array.find_index(:end)
    end_array = [temp_array[end_index - 4]]
    end_array << [temp_array[end_index - 3]]
    end_array << [temp_array[end_index - 2]]
    end_array << [temp_array[end_index - 1]]
    end_array.flatten
  end

  def create_shift(end_array)
    test = end_array.map.with_index do |char, count|
      find_index_shift(char, count)
    end
  end

  def find_index_shift(char, count)
    alphabet = rotate_alphabet(count)
    alphabet.find_index(char)
  end

  def rotate_alphabet(count)
    alphabet = (('a'..'z').to_a).push(' ')
    if count == 0
      rotated = alphabet.rotate(26)
    elsif count == 1
      rotated = alphabet.rotate(4)
    elsif count == 2
      rotated = alphabet.rotate(13)
    elsif count == 3
      rotated = alphabet.rotate(3)
    end
    rotated
  end

  def rotate_shift(split_array, shift)
    length = split_array.length
    shift_index = length - 3
    if shift_index % 4 == 0
      index = 1
    elsif (shift_index + 1) % 4 == 0
      index = 2
    elsif (shift_index + 2) % 4 == 0
      index = 3
    elsif (shift_index + 3) % 4 == 0
      index = 4
    end
    shift.rotate(index)
  end
end

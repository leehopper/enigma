class Crack

  def initialize(text)
    @text = text
  end

  def run_cracking
    text_array = split_text
    end_array = create_end_array(text_array)
  end

  def split_text
    @text.split('')
  end

  def create_end_array(text_array)
    temp_array = text_array.push(:end)
    end_index = temp_array.find_index(:end)
    shift_array = [temp_array[end_index - 4]]
    shift_array << [temp_array[end_index - 3]]
    shift_array << [temp_array[end_index - 2]]
    shift_array << [temp_array[end_index - 1]]
    shift_array.flatten
  end

end

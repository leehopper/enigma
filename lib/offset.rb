class Offset
  attr_reader :date

  def initialize(date)
    @date = date
    generate_date
  end

  def generate_date
    if @date == 'none'
      @date = (Date::today).strftime('%d%m%y')
    end
  end

  def create_shift_offset
    output = []
    4.times do |acc|
      output << translate_date[acc - 4]
    end
    convert_to_integers(output)
  end

  def translate_date
    date_shift = (@date.to_i ** 2).to_s
  end

  def convert_to_integers(shift_offset)
    shift_offset.map do |offset|
      offset.to_i
    end
  end
end

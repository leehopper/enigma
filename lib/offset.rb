class Offset
  attr_reader :date

  def initialize(date)
    @date = date
  end

  def self.unknown
    date = Date::today
    new(date.strftime('%d%m%y'))
  end

  def translate_date
    date_shift = (@date.to_i ** 2).to_s
  end

  def create_shift_offset
    output = []
    4.times do |acc|
      output << translate_date[acc - 4]
    end
    convert_to_integers(output)
  end

  def convert_to_integers(shift_offset)
    shift_offset.map do |offset|
      offset.to_i
    end
  end
end

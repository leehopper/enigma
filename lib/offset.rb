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
    output
  end
end

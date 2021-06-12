require_relative 'key'
require_relative 'offset'

class Encryption

  def initialize (text, key = 'none', date = 'none')
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
    @shift = []
  end

  def ceo
    create_shift

  end

  def create_shift
    acc = 0
    @shift = []
    @key.create_shift_key.each do |key|
      @shift << key + @offset.create_shift_offset[acc]
      acc += 1
    end
    @shift
  end
end

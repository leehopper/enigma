class Key
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def self.unknown
    new(rand(0..99999).to_s)
  end

  def create_shift_key
    output = []
    4.times do |acc|
      output << @key[acc] + @key[acc + 1]
    end
    convert_to_integers(output)
  end

  def convert_to_integers(shift_key)
    shift_key.map do |key|
      key.to_i
    end
  end
end

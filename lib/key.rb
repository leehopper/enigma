class Key
  attr_reader :key

  def initialize(key)
    @key = generate_key(key) # use || statement and nil instead of 'none'
  end

  def generate_key(key)
    if key == 'none'
      5.times.map do
        rand(10)
      end.join
    else
      key
    end
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

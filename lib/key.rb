class Key

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
    output
  end
end

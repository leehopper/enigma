require_relative 'key'
require_relative 'offset'

class Encryption

  def initialize (text, key = 'none', date = 'none')
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
  end

end

class Decryption

  def initialize (text, key, date)
    @text = text
    @key = Key.new(key)
    @offset = Offset.new(date)
  end
end

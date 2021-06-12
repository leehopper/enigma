require_relative 'encryption'

class Enigma

  def encrypt(text, key = 'none', date = 'none')
    encription= Encryption.new(text, key, date)
    encription.run_encryption
  end
end

require_relative 'encryption'
require_relative 'decryption'

class Enigma

  def encrypt(text, key = 'none', date = 'none')
    encription = Encryption.new(text, key, date)
    encription.run_encryption
  end

  def decrypt(text, key, date = 'none')
    decryption = Decryption.new(text, key, date)
    decryption.run_decryption
  end
end

require_relative 'encryption'
require_relative 'decryption'
require_relative 'crack_shift'

class Enigma

  def encrypt(text, key = 'none', date = 'none')
    encription = Encryption.new(text, key, date)
    encription.run_encryption
  end

  def decrypt(text, key, date = 'none')
    decryption = Decryption.new(text, key, date)
    decryption.run_decryption
  end

  def crack (text, date = 'none')
    crack = Crack.new(text)
    shift = crack.crack_enigma
    decryption = Decryption.new(text, 'none', date, shift)
    decryption.run_cracked_decryption
  end
end

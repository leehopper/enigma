require_relative 'enigma'

file = File.open(ARGV[0], "r")
encrypted = file.read
file.close
enigma = Enigma.new
decrypted = enigma.decrypt(encrypted, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], "w")
writer.write(decrypted[:decryption])
puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"

require_relative 'enigma'

file = File.open(ARGV[0], "r")
encrypted = file.read
file.close
enigma = Enigma.new
crack = enigma.crack(encrypted, ARGV[2])
writer = File.open(ARGV[1], "w")
writer.write(crack[:decryption])
puts "Created '#{ARGV[1]}' with the key #{crack[:key]} and date #{crack[:date]}"

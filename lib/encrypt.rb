require_relative 'enigma'

file = File.open(ARGV[0], "r")
message = file.read
file.close
enigma = Enigma.new
encrypted = enigma.encrypt(message)
writer = File.open(ARGV[1], "w")
writer.write(encrypted[:encryption])
puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"

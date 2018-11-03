require './lib/enigma'

### RUNNER FILE FOR ENIGMA WITH COMMAND LINE INTERFACE ###

handle = File.open(ARGV[0], "r")
message = handle.read
handle. close

enigma = Enigma.new
#require 'pry'; binding.pry
result = enigma.decrypt(message, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(result[:decryption])
writer.close
puts
puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
puts

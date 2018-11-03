require './lib/enigma'

### RUNNER FILE FOR ENIGMA WITH COMMAND LINE INTERFACE ###

handle = File.open(ARGV[0], "r")
message = handle.read
handle. close

enigma = Enigma.new
result = enigma.encrypt(message)

writer = File.open(ARGV[1], "w")
writer.write(result[:encryption])
writer.close
puts
puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"
puts

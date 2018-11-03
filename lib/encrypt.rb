require './lib/enigma'
require './lib/file_io'

### RUNNER FILE FOR ENCRYPTION WITH COMMAND LINE INTERFACE ###

include FileIO

message = file_read(ARGV[0])
enigma = Enigma.new
result = enigma.encrypt(message)
file_write(ARGV[1], result[:encryption])

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"

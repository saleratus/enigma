require './lib/enigma'
require './lib/file_io'

### RUNNER FILE FOR DECRYPTION WITH COMMAND LINE INTERFACE ###

include FileIO

message = file_read(ARGV[0])
enigma = Enigma.new
result = enigma.decrypt(message, ARGV[2], ARGV[3])
file_write(ARGV[1], result[:decryption])

puts "Created '#{ARGV[1]}' with the key #{result[:key]} and date #{result[:date]}"

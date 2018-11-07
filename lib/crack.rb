require './lib/enigma'
require './lib/file_io'

### RUNNER FILE FOR CRACKING WITH COMMAND LINE INTERFACE ###

include FileIO

message = file_read(ARGV[0])
enigma = Enigma.new
result = enigma.crack(message, ARGV[2] = nil)
file_write(ARGV[1], result[:decryption])

puts "Created '#{ARGV[1]}' with the cracked key #{result[:key]} and date #{result[:date]}"

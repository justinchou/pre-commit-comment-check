#!/usr/bin/env ruby

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

puts ARGV[0]
puts ARGV[1]
puts ARGV[2]

message_file = ARGV[0]
message = File.read(message_file)

$chineseReg = /[\u4e00-\u9fa5]/

if $chineseReg.match(message)
  puts "Error: -----------------------------------------" 
  puts " Your commit message contains chinese character." 
  puts " It must contain no chinese."
  puts "------------------------------------------------" 
  exit 1
end

$refReg = /^refs\s#[0-9]+,.*\S+.*/

if !$refReg.match(message)
  puts "Error: -----------------------------------------" 
  puts " Your commit message is not formatted correctly." 
  puts " It must contain an issue number." 
  puts " Example:" 
  puts "      refs #99999, Added some new feature" 
  puts "------------------------------------------------" 
  exit 2
end

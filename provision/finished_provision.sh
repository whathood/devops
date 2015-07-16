#!/usr/bin/env ruby

site="http://localhost:8082"

result=system("wget #{site}")

puts result.inspect

puts "setup complete"
puts " "
puts " "
puts "visit #{site} on your host machine to test"
puts " "


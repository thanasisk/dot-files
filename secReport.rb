#!/usr/bin/env ruby
# a quick script to generate statistics on a debian system
# based on debsecan(1)
# 6 calls to debsecan? insane!!!
# this is why we call once and let Ruby do the rest

$COMMAND = "debsecan --suite squeeze"
output = `#{$COMMAND}`
high = output.grep(/high/).length
highr = output.grep(/high/).grep(/remotely/).length
medium = output.grep(/medium/).length
mediumr = output.grep(/medium/).grep(/remotely/).length
low = output.grep(/low/).length
lowr = output.grep(/low/).grep(/remotely/).length 

puts "#{high} HIGH risk vulnerabilities of which #{highr} remote"
puts "#{medium} MEDIUM risk vulnerabilities of which #{mediumr} remote"
puts "#{low} LOW risk vulnerabilities of which #{lowr} remote"

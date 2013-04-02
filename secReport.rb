#!/usr/bin/env ruby
# a quick script to generate statistics on a debian system
# based on debsecan(1)
# this is extremely slow btw - need to optimize it 
# 6 calls to debsecan? insane!!!

$COMMAND = "debsecan --suite squeeze"
high 	= `#{$COMMAND} |grep high |wc -l`
highr	= `#{$COMMAND} |grep high |grep remotely |wc -l`
medium 	= `#{$COMMAND} |grep medium |wc -l`
mediumr	= `#{$COMMAND} |grep medium |grep remotely |wc -l`
low 	= `#{$COMMAND} |grep low |wc -l`
lowr	= `#{$COMMAND} |grep lowr |grep remotely |wc -l`

puts "#{high.chomp} HIGH risk vulnerabilities of which #{highr.chomp} remote"
puts "#{medium.chomp} MEDIUM risk vulnerabilities of which #{mediumr.chomp} remote"
puts "#{low.chomp} LOW risk vulnerabilities of which #{lowr.chomp} remote"

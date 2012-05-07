#!/usr/bin/env ruby
# a small symlink integrity checker inspired by Wicked Cool Ruby Scripts

unless File.directory?(ARGV[0])
    puts "%s is not a valid directory - Please check your path and try again" % ARGV[0]
    exit
end

Dir.open(ARGV[0]) do |adir|
    adir.each do |afile|
        next unless FileTest.symlink?(afile)
        # TODO add code to check directories
        next if File.file?(afile)
        puts "Bad Link: #{File.expand_path(afile)}"
    end
end

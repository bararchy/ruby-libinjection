require 'ffi'
require_relative '../lib/Filter_Sqli.rb'

puts FilterSqli.is_sqlinjection?(ARGV[0])

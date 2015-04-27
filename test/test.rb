require 'ffi'
require_relative '../lib/Filter_Sqli.rb'

result =  FilterSqli.is_sqlinjection?(ARGV[0])
if result == 0
  puts "No SQLi Found"
else
  puts "SQLi Found!"
end

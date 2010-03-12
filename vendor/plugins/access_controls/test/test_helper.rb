access_controls_lib = File.join( File.dirname(__FILE__), "..", "lib")
test_lib = File.dirname(__FILE__)
$:.unshift(access_controls_lib)
$:.unshift(test_lib)
$:.unshift(File.join(test_lib, "lib"))
puts access_controls_lib
puts test_lib

require 'rubygems'
require 'shoulda'
require 'active_support'
require 'active_support/test_case'
require 'ruby-debug'

puts "requiring access_controls"
unless defined?(AccessControls)
  unless defined?(CONFIG_FILE)
    CONFIG_FILE = File.join(test_lib, "access_config.yml")
  end
  require 'access_controls'
end
puts "done"

include AccessControls
puts "Successfully loaded test_helper"

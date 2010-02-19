# Include hook code here

puts "loading access_controls"
require 'access_controls'
ActionView::Base.send(:include, AccessControls::ActionViewExtensions)
ActionController::Base.send(:include, AccessControls::ActionControllerExtensions)
AccessControls::PLUGIN_CONFIG[:role_target_model].send(:include, AccessControls::UserModelMethods)
puts "done loading access_controls.  Testing."
begin
  User.first.roles
rescue Exception => e
  puts e.message
  puts e.backtrace.join("\n")
  debugger
  nil
end
puts "loaded access controls successfully"

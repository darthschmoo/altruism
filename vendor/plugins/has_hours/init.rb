# Include hook code here
require 'has_hours'
require File.join( File.dirname(__FILE__), 'app', 'helpers', 'hours_helper')

ActiveRecord::Base.class_eval do
  include BCA::HasHours
end

ActionView::Base.class_eval do
  include BCA::HoursHelper
end

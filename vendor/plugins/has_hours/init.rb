# Include hook code here
require 'has_hours'

ActiveRecord::Base.class_eval do
  include BCA::HasHours
end

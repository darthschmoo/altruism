class Event < ActiveRecord::Base
  has_event_calendar
  validates_temporal_sanity :start_at, :end_at
end

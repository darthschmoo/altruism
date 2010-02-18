class Event < ActiveRecord::Base
  has_event_calendar
  attr_accessor :start_at_text, :end_at_text

  validate do |event|
    _start = Chronic.parse(event.start_at_text)
    _end   = Chronic.parse(event.end_at_text)

    event.errors.add(:start_at_text, " could not be understood") if _start.nil?
    event.errors.add(:end_at_text, " could not be understood")   if _end.nil?

    event.start_at = _start
    event.end_at   = _end
  end

  validate do |event|
    if event.start_at && event.end_at
      unless event.start_at < event.end_at
        event.errors.add(:start_time, "must begin before it ends.")
      end
    end
  end

  validates_presence_of :start_at, :if => Proc.new{ |event| event.start_at_text.blank?}
  validates_presence_of :end_at,   :if => Proc.new{ |event| event.end_at_text.blank?}

  def calendar
    { :year => start_at.year, :month => start_at.month }
  end
end

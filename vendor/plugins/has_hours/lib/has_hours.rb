# HasHours

module BCA
  module HasHours
    def self.included(base)
      base.extend(HasHoursMacro)
    end

    module HasHoursMacro
      def has_hours(options = {})
        has_many :hours
        label = options[:label] || :open

        self.extend(ClassMethods)
        self.send(:include, InstanceMethods)

        named_scope label, lambda { |day, from, to|
          { :conditions => ["day = ? AND start_at <= ? AND end_at >= ?", day, from, to ] }
        }
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def available_during_hours?(day, from_time, to_time)
        self.hours.detect{ |h|
          h.spans(from_time, to_time)
        }
      end
    end
  end
end

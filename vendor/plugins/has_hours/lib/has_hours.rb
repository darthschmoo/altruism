# HasHours

module BCA
  module HasHours
    def self.included(base)
      base.extend(HasHoursMacro)
    end

    module HasHoursMacro
      def has_hours(options = {})
        puts "has_hours"
        self.extend(ClassMethods)
        self.send(:include, InstanceMethods)
        if options[:label]
          self.send(:add_has_hours_finder_function, options[:label])
        else
          self.send(:add_has_hours_finder_function)
        end

        has_many :hours
      end
    end

    module ClassMethods
      # def another_hours_classmethod
      #   nil
      # end

      protected
      def add_has_hours_finder_function(label = "open")
        eval <<-EOS
          @has_hours_label = :#{label}
          attr_accessor :has_hours_label
          def find_#{label}( from = Time.now, to = 2.hours.from_now )
            []
          end
        EOS
      end
    end

    module InstanceMethods
      # def hours
      #   puts "We're always open!"
      # end
    end
  end
end



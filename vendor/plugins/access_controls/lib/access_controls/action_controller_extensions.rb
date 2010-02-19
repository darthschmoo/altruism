module AccessControls
  module ActionControllerExtensions
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def require_role(*args)
        filter_options = args.last.is_a?(Hash) ? args.pop : {}
        if args.length > 1
          args.each{ |role|
            require_role(role, filter_options)
          }
        else
          before_filter(filter_options) do |controller|
            controller.access_denied unless controller.current_user.has_role?( args.first )
          end
        end
      end

      def require_permission(*args)
        filter_options = args.last.is_a?(Hash) ? args.pop : {}
        if args.length > 1
          args.each{ |permission|
            require_permission(permission, filter_options)
          }
        else
          before_filter(filter) do |controller|
            controller.access_denied unless controller.current_user.has_permission?( args.first )
          end
        end
      end
    end
  end
end



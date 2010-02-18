module AccessControl
  module ActionControllerExtensions
    def self.require_role(*args)
      filter_options = args.last.is_a?(Hash) ? args.pop : {}
      if args.length > 1
        args.each{ |role|
          require_role(role, filter_options)
        }
      else
        before_filter(filter_options) do
          @user.has_role? args.first
        end
      end
    end

    def self.require_permission(*args)
      filter_options = args.last.is_a?(Hash) ? args.pop : {}
      if args.length > 1
        args.each{ |permission|
          require_permission(permission, filter_options)
        }
      else
        before_filter(filter) do
          @user.has_permission? args.first
        end
      end
    end
  end
end



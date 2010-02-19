module AccessControls
  module UserModelMethods
    def self.included(base)
       base.class_eval do
        has_many :role_grants,
        :table_name => :access_controls_roles_users,
        :class_name => "AccessControls::RoleGrant",
        :source => :access_controls_roles_users
        has_many :roles,
        :through => :role_grants,
        :class_name => "AccessControls::Role"
      end
      base.send(:include, InstanceMethods)
    end

    module InstanceMethods
      def has_permission?(*args)
        opts = args.last.is_a?(Hash) ? args.pop : {}
        permissions = Permission.to_permissions(args)

        if opts[:all]
          permissions.each{ |p|
            return false unless self.has_permission?(p)
          }
          return true
        else
          permissions.each{ |p|
            roles.each{ |r|
              return true if r.permissions.include?(p)
            }
          }
          return false
        end
      end

      def has_role?(*args)
        opts = args.last.is_a?(Hash) ? args.pop : {}

        roles = Role.to_roles(args)

        if opts[:all]
          roles.each{ |r|
            return false unless self.roles.include?(r)
          }
          return true
        else
          roles.each{ |r|
            return true if self.roles.include?(r)
          }
          return false
        end
      end
    end
  end
end

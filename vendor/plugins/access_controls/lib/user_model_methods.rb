module AccessControl
  module UserModelMethods
    def has_permission?(*args)
      opts = args.last.is_a?(Hash) ? args.pop : {}
      permissions = AccessControl::Permission.to_permissions(args)

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

      roles = AccessControl::Role.to_role(args)

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

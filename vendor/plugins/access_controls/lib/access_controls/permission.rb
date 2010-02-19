module AccessControls
  class Permission < ActiveRecord::Base
    set_table_name "access_controls_permissions"
    has_many :roles, :through => :permission_roles
    has_many :permission_roles,
    :class_name => "AccessControls::PermissionRole"


    def self.to_permissions(p)
      permission = case p
                   when Permission
                     p
                   when Symbol
                     Permission.find_by_name(p.to_s)
                   when String
                     Permission.find_by_name(p)
                   when Array
                     p.map{ |p| to_permissions(p) }.flatten
                   end
    end
  end
end


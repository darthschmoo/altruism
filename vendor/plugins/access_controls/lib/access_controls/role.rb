module AccessControls
  class Role < ActiveRecord::Base
    set_table_name "access_controls_roles"
    has_many :permission_roles,
      :table_name => :access_controls_permissions_roles,
      :class_name => "AccessControls::PermissionRole"
    has_many :permissions, :through => :permission_roles,
      :class_name => "AccessControls::Permission"
    has_many :role_grants,
      :class_name => "AccessControls::RoleGrant",
      :table_name => :access_controls_roles_users
    has_many :users, :through => :role_grants, :class_name => "User"

    def self.to_roles(r)
      role = case r
             when Role
               r
             when Symbol
               Role.find_by_name(r.to_s)
             when String
               Role.find_by_name(r)
             when Array
               r.map{ |r| to_roles(r) }.flatten
             end
    end
  end
end

class AccessControl::Role
  set_table_name "access_control_roles"
  has_many :permissions, :through => :role_permissions
  has_many :users, :through => :role_grantings, :class => PLUGIN_CONFIG[:role_target_model]

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

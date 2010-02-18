class AccessControl::Permission < ActiveRecord::Base
  set_table_name "access_control_permissions"
  has_many :roles, :through => :role_permissions


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

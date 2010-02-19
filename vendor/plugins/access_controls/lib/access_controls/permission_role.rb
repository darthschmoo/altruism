module AccessControls
  class PermissionRole < ActiveRecord::Base
    set_table_name :access_controls_permissions_roles
    belongs_to :permission  #, :table_name => :access_controls_permissions
    belongs_to :role
  end
end

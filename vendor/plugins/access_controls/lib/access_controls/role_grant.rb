module AccessControls
  class RoleGrant < ActiveRecord::Base
    # debugger
    set_table_name "access_controls_roles_users"
    belongs_to :user, :class_name => "User" # AccessControls::PLUGIN_CONFIG[:role_target_model].class_name
    belongs_to :role
  end
end

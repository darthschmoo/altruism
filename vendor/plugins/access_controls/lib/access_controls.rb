# AccessControls
def load_plugin_config(file)
  raw_config = YAML.load(File.open(file))
  config = raw_config[RAILS_ENV] || HashWithIndifferentAccess.new
  config.reverse_merge( raw_config[:shared] )
end

module AccessControls
  config = load_plugin_config( File.join( Rails.root, "config", "access_config.yml") )
  config[:role_target_model] = User
  PLUGIN_CONFIG = config
end

require 'access_controls/user_model_methods'
require 'access_controls/action_view_extensions'
require 'access_controls/action_controller_extensions'
require 'access_controls/role'
require 'access_controls/role_grant'
require 'access_controls/permission'
require 'access_controls/permission_role'


# AccessControls
def load_plugin_config(file)
  env = defined?(RAILS_ENV) ? RAILS_ENV : :test
  raw_config = YAML.load(File.open(file))
  config = raw_config[env] || HashWithIndifferentAccess.new
  config.reverse_merge( raw_config[:shared] )
end

module AccessControls
end

unless defined?(AccessControls::PLUGIN_CONFIG)
  config = if defined?(CONFIG_FILE)
             load_plugin_config(CONFIG_FILE)
           else
             load_plugin_config( File.join( Rails.root, "config", "access_config.yml") )
           end
  debugger
  config[:role_target_model] = Kernel.const_get(config[:role_target_model])
  AccessControls::PLUGIN_CONFIG = config
end


require 'access_controls/user_model_methods'
require 'access_controls/action_view_extensions'
require 'access_controls/action_controller_extensions'
require 'access_controls/role'
require 'access_controls/role_grant'
require 'access_controls/permission'
require 'access_controls/permission_role'


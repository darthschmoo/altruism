# Include hook code here
raw_config = YAML.load(File.read(RAILS_ROOT + "/config/access_config.yml"))
config = raw_config[RAILS_ENV] || HashWithIndifferentAccess.new
config.reverse_merge( raw_config[:shared] )
AccessControl::PLUGIN_CONFIG = config

AccessControl::PLUGIN_CONFIG[:role_target_model] = User

ActionView.extend(AccessControl::ActionViewExtensions)

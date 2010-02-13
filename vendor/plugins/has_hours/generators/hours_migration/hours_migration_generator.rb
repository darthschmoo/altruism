class HoursMigrationGenerator < Rails::Generator::Base
  def initialize( runtime_args, runtime_options = {} )
    super( runtime_args, runtime_options )
    @migration_directory = File.join( Rails.root, 'db', 'migrate' )
  end

  def manifest
    record do |m|
      # m.directory "lib"
      # m.template 'README', "README"

      m.migration_template( "create_hours_migration.rb", @migration_directory, :migration_file_name => "create_hours" )
    end
  end

  def banner
    "Usage #{$0} hours_migration"
  end
end


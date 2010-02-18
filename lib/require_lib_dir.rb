require 'core_extensions/dir'

lib_dir = File.join(Rails.root, "lib")

# yields every filename within the directory,
# ending in '.rb' for requiring.
Dir.traverse( lib_dir, :match => /\.rb$/ ) do |f|
  unless f == __FILE__
    f.gsub!(/\.rb$/, '')
    require f
  end
end

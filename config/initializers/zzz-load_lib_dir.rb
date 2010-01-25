  # require everything in the lib/ directory.
  Dir["lib/**/*.rb"].each{|f| require f.gsub( /\.rb$/, "" )}

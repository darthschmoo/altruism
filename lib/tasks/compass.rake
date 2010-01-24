namespace :compass do
  desc "Regenerate css files as their sass source files change."
  task :watch do
    config = "config/compass.rb"
    css_dir = "public/stylesheets"
    sass_dir = "public/sass_stylesheets"

    system("compass -w --sass-dir #{sass_dir} --css-dir #{css_dir} --config #{config}")
  end
end

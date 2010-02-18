unless defined?(FileWalker)
  class Dir
    def self.traverse(*args, &block)
      FileWalker.traverse(*args, &block)
    end
  end

  class FileWalker
    def self.traverse( dir, opts = {} )
      directories = self.get_initial_directories(dir)

      while directories.length > 0
        d = directories.pop

        Dir["#{d}/*"].each do |f|
          if File.file?( f )
            yield f if !opts.has_key?(:match) || f =~ opts[:match]
          elsif File.directory?(f) && follow_symlink?(f, opts) && recurse?(f,opts)
            unless f == ".." || f == "."
              directories << f
            end
          end
        end
      end
    end
    def self.get_initial_directories( dir )
      if dir.is_a?(Array)
        directories = dir.map{ |d| d.strip }
      elsif dir.is_a?(String)
        directories = [dir.strip]
      end
      directories
    end

    def self.follow_symlink?(f, opts)
      opts[:follow_symlinks] || !File.symlink?(f)
    end

    def self.recurse?(d, opts)
      opts[:recurse_if].blank? || opts[:recurse_if].call(d)
    end
  end
end

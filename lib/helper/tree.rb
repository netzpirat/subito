class Tree

  #
  # Show the tree representation of the project
  #   +project+ the project to visualize
  #   +options+ the command line options
  #
  def self.show(project, options)
    print "#{project.to_s}" 
    
    # Project type
    if options.verbose?
      if project.radiant_project?
        puts " (Radiant Project)"
      else
        puts " (Rails Project)"
      end
    else
      print "\n"
    end
    
    # Radiant extensions
    connection = project.plugins_installed? || project.radiant_installed? ? "|" : " "
    
    if project.extensions_installed?
      puts '+--+ Extensions'
      project.extensions.each do |extension|
        puts "#{connection}  +- #{extension.to_s}"
        indent = extension == project.extensions.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(extension, indent, options) if options.remotes?
      end
    end

    # Plugins
    connection = project.radiant_installed? ? "|" : " "
    
    if project.plugins_installed?
      puts '+--+ Plugins'
      project.plugins.each do |plugin|
        puts "#{connection}  +- #{plugin.to_s}"
        indent = plugin == project.plugins.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(plugin, indent, options) if options.remotes?
      end
    end
    
    # Radiant in vendor
    if project.radiant_installed?
      
      # Radiant itself
      puts '+--+ Radiant'
      self.put_remotes(project.radiant.first, "   |  ", options) if options.remotes?
      
      # Radiant Plugins
      if project.radiant_plugins_installed?
        puts '   +--+ Plugins'
        project.radiant_plugins.each do |plugin|
          puts "      +- #{plugin.to_s}"
          indent = plugin == project.radiant_plugins.last ? "         " : "      |  "
          self.put_remotes(plugin, indent, options) if options.remotes?
        end
      end
    end
    
  end
  
  private 
  
    #
    # Prints the submodules remotes
    #   +submodule+ the submodule the display
    #   +indent+ the indent of the output
    #   +options+ the command line options
    #
    def self.put_remotes(submodule, indent, options)
      submodule.remotes.each do |name, url|
        if options.verbose?
          puts "#{indent}+- #{name} - #{url}"
        else
          puts "#{indent}+- #{name}"
        end
      end

    end

end
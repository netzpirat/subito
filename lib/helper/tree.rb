class Tree

  #
  # Show the tree representation of the project
  #   +project+ the project to visualize
  #   +verbose+ show vernbose information
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
    if project.extensions_installed?
      puts '+-->extensions'
      project.extensions.each do |extension|
        puts "|  +-->#{extension.to_s}"
        self.put_remotes(extension, "|  |  ", options) if options.remotes?
      end
    end

    # Plugins
    if project.plugins_installed?
      puts '+-->plugins'
      project.plugins.each do |plugin|
        puts "|  +-->#{plugin.to_s}"
        self.put_remotes(plugin, "|  |  ", options) if options.remotes?
      end
    end
    
    # Radiant in vendor
    if project.radiant_installed?
      
      # Radiant itself
      puts '+->radiant'
      self.put_remotes(project, "   |  ", options) if options.remotes?
      
      # Radiant Plugins
      if project.radiant_plugins_installed?
        puts '     +-->plugins'
        project.radiant_plugins.each do |plugin|
          puts "       +-->#{plugin.to_s}"
          self.put_remotes(plugins, "       |", options) if options.remotes?
        end
      end
    end
    
  end
  
  private 
  
    #
    # Prints the submodules remotes
    #   +submodule+ the submodule the display
    #   +indent+ the indent of the output
    #
    def self.put_remotes(submodule, indent, options)
      submodule.remotes.each do |name, url|
        if options.verbose?
          puts "#{indent}+-->#{name} (#{url})"
        else
          puts "#{indent}+-->#{name}"
        end
      end
    end

end
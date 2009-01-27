class Tree

  #
  # Show the tree representation of the project
  # +project+ the project to visualize
  # +verbose+ show vernbose information
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
      puts '+-extensions'
      project.extensions.each do |extension|
        puts "  +-#{extension.to_s}"
      end
    end

    # Plugins
    if project.plugins_installed?
      puts '+-plugins'
      project.plugins.each do |plugin|
        puts "  +-#{plugin.to_s}"
      end
    end
    
    # Radiant in vendor
    if project.radiant_installed?
      puts '+-radiant'
      # Radiant Plugins
      if project.radiant_plugins_installed?
        puts '  +-plugins'
        project.radiant_plugins.each do |plugin|
          puts "    +-#{plugin.to_s}"
        end
      end
    end
    
  end

end
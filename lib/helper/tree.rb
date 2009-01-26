class Tree

  #
  # Show the tree representation of the project
  #
  def self.show(project)
    print "#{project.to_s}" 
    
    # Project type
    if project.radiant?
      puts " (Radiant Project)"
    else
      puts " (Rails Project)"
    end
    
    # Radiant extensions
    if project.extensions?
      puts '+-extensions'
      project.extensions.each do |extension|
        puts "  +-#{extension.to_s}"
      end
    end

    # Plugins
    if project.plugins?
      puts '+-plugins'
      project.plugins.each do |plugin|
        puts "  +-#{plugin.to_s}"
      end
    end
    
    # Radiant in vendor
    if project.radiant
      puts '+-radiant'
      # Radiant Plugins
      if project.radiant_plugins?
        puts '  +-plugins'
        project.radiant_plugins.each do |plugin|
          puts "    +-#{plugin.to_s}"
        end
      end
    end
    
  end

end
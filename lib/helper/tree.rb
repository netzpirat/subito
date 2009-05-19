class Tree

  #
  # Show the tree representation of the project and each submodule last log entry
  #   +project+ the project to visualize
  #   +options+ the command line options
  #
  def self.log(project, options)
    show project, options, :log
  end

  #
  # Show the tree representation of the project and each submodule status
  #   +project+ the project to visualize
  #   +options+ the command line options
  #
  def self.status(project, options)
    show project, options, :status
  end

  #
  # Show the tree representation of the project
  #   +project+ the project to visualize
  #   +options+ the command line options
  #   +command+ additional command to visualize in the tree
  #
  def self.show(project, options, command = '')
    print "#{project.to_s}".dark_green
    
    # Project type
    if options.verbose?
      if project.radiant_project?
        puts " (Radiant Project)".magenta
      else
        puts " (Rails Project)".magenta
      end
    else
      print "\n"
    end
    
    # Radiant extensions
    connection = project.plugins_installed? || project.radiant_installed? ? "|" : " "
    
    if project.extensions_installed?
      puts '+--+'.blue + ' Extensions'.dark_green
      project.extensions.each do |extension|
        process_command command, extension do
          print "#{connection}  +- ".blue + "#{extension.to_s}".yellow
        end
        indent = extension == project.extensions.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(extension, indent, options, command) if options.remotes?
      end
    end

    # Plugins
    connection = project.radiant_installed? ? "|" : " "
    
    if project.plugins_installed?
      puts '+--+ '.blue + 'Plugins'.dark_green
      project.plugins.each do |plugin|
        process_command command, plugin do
          print "#{connection}  +- ".blue + "#{plugin.to_s}".yellow
        end
        indent = plugin == project.plugins.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(plugin, indent, options, command) if options.remotes?
      end
    end
    
    # Radiant in vendor
    if project.radiant_installed?
      
      # Radiant itself
      puts '+--+ '.blue + 'Radiant'.dark_green
      self.put_remotes(project.radiant.first, "   |  ", options, command) if options.remotes?
      
      # Radiant Plugins
      if project.radiant_plugins_installed?
        puts '   +--+ '.blue + 'Plugins'.dark_green
        project.radiant_plugins.each do |plugin|
          process_command command, plugin do
            print "      +- ".blue + "#{plugin.to_s}".yellow
          end
          indent = plugin == project.radiant_plugins.last ? "         " : "      |  "
          self.put_remotes(plugin, indent, options, command) if options.remotes?
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
    #   +command+ command to process, currently :log and :status is known
    #
    def self.put_remotes(submodule, indent, options, command)
      submodule.remotes.each do |name, url|
        if options.verbose?
          if submodule.branch.empty?
            process_command command, submodule do
              print "#{indent}+- ".blue + "#{name}".cyan + "/".blue + "NO BRANCH".red + " -> ".blue + "#{url}".dark_white
            end
          else
            process_command command, submodule do
              print "#{indent}+- ".blue + "#{name}".cyan + "/#{submodule.branch} -> ".blue + "#{url}".dark_white
            end
          end
        else
          process_command command, submodule do
            print "#{indent}+- ".blue + "#{name}".cyan
          end
        end
      end
    end

    #
    # Process a given command and append its output the the
    # tree view
    #   +command+ command to process, currently :log and :status is known
    #   +submodule+ the submodule to execute the command
    #
    def self.process_command(command, submodule)
      yield
      case command
        when :log     
          puts " -> ".blue + submodule.last_log
        
        when :status
          status = submodule.status
          if status =~ /nothing/
            puts ""
          else 
            puts " -> ".blue + submodule.status.sub("updated:", "updated.")
          end

        else puts ""
      end
    end

end
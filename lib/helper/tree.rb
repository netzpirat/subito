class Tree

  #
  # Show the tree representation of the project
  #   +project+ the project to visualize
  #   +options+ the command line options
  #
  def self.show(project, options)
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
        puts "#{connection}  +- ".blue + "#{extension.to_s}".yellow
        indent = extension == project.extensions.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(extension, indent, options) if options.remotes?
      end
    end

    # Plugins
    connection = project.radiant_installed? ? "|" : " "
    
    if project.plugins_installed?
      puts '+--+ '.blue + 'Plugins'.dark_green
      project.plugins.each do |plugin|
        puts "#{connection}  +- ".blue + "#{plugin.to_s}".yellow
        indent = plugin == project.plugins.last ? "#{connection}     " : "#{connection}  |  "
        self.put_remotes(plugin, indent, options) if options.remotes?
      end
    end
    
    # Radiant in vendor
    if project.radiant_installed?
      
      # Radiant itself
      puts '+--+ '.blue + 'Radiant'.dark_green
      self.put_remotes(project.radiant.first, "   |  ", options) if options.remotes?
      
      # Radiant Plugins
      if project.radiant_plugins_installed?
        puts '   +--+ '.blue + 'Plugins'.dark_green
        project.radiant_plugins.each do |plugin|
          puts "      +- ".blue + "#{plugin.to_s}".yellow
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
          puts "#{indent}+- ".blue + "#{name}".cyan + " - ".blue + "#{url}".dark_white
        else
          puts "#{indent}+- ".blue + "#{name}".cyan
        end
      end

    end
end

#
# Adds colorization to String class
#
class String
    def red; colorize(self, "\e[1m\e[31m"); end
    def dark_red; colorize(self, "\e[31m"); end
    
    def green; colorize(self, "\e[1m\e[32m"); end
    def dark_green; colorize(self, "\e[32m"); end
    
    def yellow; colorize(self, "\e[1m\e[33m"); end
    def dark_yellow; colorize(self, "\e[33m"); end
    
    def blue; colorize(self, "\e[1m\e[34m"); end
    def dark_blue; colorize(self, "\e[34m"); end
    
    def magenta; colorize(self, "\e[1m\e[35m"); end
    def dark_magenta; colorize(self, "\e[35m"); end
    
    def cyan; colorize(self, "\e[1m\e[36m"); end
    def dark_cyan; colorize(self, "\e[36m"); end    
    
    def white; colorize(self, "\e[1m\e[37m"); end
    def dark_white; colorize(self, "\e[37m"); end
      
    def colorize(text, color_code)  "#{color_code}#{text}\e[0m" end
end
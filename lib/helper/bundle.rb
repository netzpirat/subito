class Bundle
  
  BUNDLE = "config/extensions.yml"
  
  #
  # Generates a bundle file with the submodule configuration
  #   +project+ the project to install its bundle
  #   +options+ the command line options
  #
  def self.generate(project, options)
    File.open(project.root + BUNDLE, 'w') do |file| 
      file.write("---\n")
      project.extensions.each do |extension|
        
        file.write("- name: #{extension.to_s}\n")
        file.write("  hub: #{hub(extension.to_s, extension.remotes['origin'])}\n")

        extension.remotes.delete('origin')
        
        if options.remotes?
          file.write("  remotes:\n")
          extension.remotes.each do |name, url|
            remote = hub(extension.to_s, url, true)
            file.write("    - #{remote}\n")
          end
        end
      
      end
      
      puts "Bundle written to " + BUNDLE
    end

    File.open(project.root + BUNDLE).each { |line| puts line } if options.verbose?
  end
  
  #
  # Installs the submodules from the bundle
  #   +project+ the project to install its bundle
  #   +options+ the command line options
  #
  def self.install(project, options)
    bundle = YAML::load_file(project.root + BUNDLE)
    bundle.each do |extension|
      name = extension['name']
      if not project.extensions.map{|e| e.to_s }.include?(name)
        puts "TODO: Installing" + name
      end
      if extension['remotes']
        extension['remotes'].each do |remote|
          Dir.chdir(project.root + "vendor/extensions" + name) do
            puts "TODO: Register " + remote
          end
        end
      end
    end
  end
  
  private
  
    #
    # Gets the hub from the repositories url
    #   +name+ name of the extension
    #   +url+ the url to the extensions repository
    #   +remote+ true if remote
    #
    def self.hub(name, url, remote = false)
      if url =~ /git(@|:\/\/)github.com(:|\/)([a-zA-z0-9_\-]+)\/([a-zA-z0-9_\-]+).git/
        if remote and not known_format?(Regexp.last_match(4), name)
          return Regexp.last_match(3) + '/' + Regexp.last_match(4)
        else
          return Regexp.last_match(3)
        end
      else
        return url
      end
    end

    #
    # Is the format of the radiant extension naming known?
    #   +full_name+ full name of the extension, eg. radiant-comments-extension
    #   +name+ name of the extension, e.g. comments
    #
    def self.known_format?(full_name, name)
      decline_radiant_extension(name).include?(full_name)
    end

    #
    # Returns an array of known radiant extension naming variants
    #   +name+ name of the extension
    #
    def self.decline_radiant_extension(name)
       [
         "radiant-#{name}-extension",
         "radiant-#{name.to_s.gsub('_','-')}-extension",
         "radinat-#{name}",
         "radiant-#{name.to_s.gsub('_','-')}",
         "#{name}",
         "#{name}.gsub('_','-')",
         "radiant_#{name}_extension",
         "radiant_#{name.to_s.gsub('_','-')}_extension",
         "radinat_#{name}",
         "radiant_#{name.to_s.gsub('_','-')}",
       ]
    end
end
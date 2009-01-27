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
        
        puts "Process extension '#{extension.to_s}'" if options.verbose?
        
        file.write("- name: #{extension.to_s}\n")
        file.write("  hub: #{hub(extension.remotes['origin'])}\n")
        
        if options.remotes?
          extension.remotes.each do |name, url|
            remote = hub(url, true)
            file.write("  - remote: #{remote}\n") if name != 'origin'
            puts "Remote #{remote} registered" if options.verbose?
          end
        end
      
      end
      
      puts "Bundle written to " + BUNDLE
    end
    
  end
  
  #
  # Installs the submodules from the bundle
  #   +project+ the project to install its bundle
  #   +options+ the command line options
  #
  def self.install(project, options)
    puts "Not yet implemented"
    exit 1
  end
  
  private
  
    #
    # Gets the hub from the repositories url
    #   +url+ the url to the extensions repository
    #
    def self.hub(url, remote = false)
      if url =~ /git(@|:\/\/)github.com(:|\/)([a-zA-z0-9_\-]+)\/([a-zA-z0-9_\-]+).git/
        if remote
          return Regexp.last_match(3) + '/' + Regexp.last_match(4)
        else
          return Regexp.last_match(3)
        end
      else
        return url
      end
    end
  
end
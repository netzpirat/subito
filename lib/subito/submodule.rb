class Submodule

  attr_reader :git, :root
  
  CONFIG = '.git/config'
  
  #
  # Initialize a new submodule
  #   +git+ the git directory of the submodule 
  #
  def initialize(git)
    @git = git
    @root = git.parent
  end

  #
  # Is the submodule an installed radiant extension?
  #
  def extension?
    type == 'extensions'
  end

  #
  # Is the submodule a plugin?
  #
  def plugin?
    type == 'plugins'
  end
  
  #
  # Is the submodule the Radiant submodule?
  #
  def radiant?
    type == 'radiant'
  end
  
  #
  # Type of the submodule. Is either one of
  # * extension
  # * plugin
  # * radiant
  #
  def type
    @root.parent.basename.to_s
  end
  
  #
  # Get all remotes
  #
  def remotes
    Hash[File.open(@root + CONFIG).read.scan(/\[remote "([a-zA-z0-9\-_]+)"\]\n\s+url\s=\s([a-zA-Z\-_\/\.:@]+.git)\n/m)]
  end
  
  #
  # Is the submodule installed in the radiant vendor folder
  #
  def radiant_vendor?
    begin
      @root.parent.parent.parent.basename.to_s == 'radiant'
    rescue
    end
  end  
  
  #
  # Name of the submodule
  #
  def to_s
    @root.basename
  end
  
end
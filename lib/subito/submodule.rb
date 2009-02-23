class Submodule

  attr_reader :git, :root
  
  CONFIG = '.git/config'
  HEAD = '.git/HEAD'
  
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
    @root.parent.basename.to_s == 'extensions'
  end

  #
  # Is the submodule a plugin?
  #
  def plugin?
    @root.parent.basename.to_s == 'plugins'
  end
  
  #
  # Is the submodule the Radiant submodule?
  #
  def radiant?
    @root.basename.to_s == 'radiant'
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
  # Get all remotes
  #
  def remotes
    @remotes ||= Hash[File.open(@root + CONFIG).read.scan(/\[remote "([a-zA-z0-9\-_]+)"\]\n\s+url\s=\s([a-zA-Z\-_\/\.:@]+.git)\n/m)]
  end

  #
  # Get actual branch
  #
  def branch
     @branch ||= File.open(@root + HEAD).read.scan(/ref: refs\/heads\/(.*)/)
  end

  #
  # Name of the submodule
  #
  def to_s
    @root.basename
  end
  
end
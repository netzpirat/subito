class Submodule

  attr_reader :git, :root
  
  CONFIG = 'config'
  HEAD = 'HEAD'
  
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
    @remotes ||= Hash[File.open(@git + CONFIG).read.scan(/\[remote "([a-zA-z0-9\-_]+)"\]\n\s+url\s=\s([a-zA-Z\-_\/\.:@]+.git)\n/m)]
  end

  #
  # Get actual branch
  #
  def branch
     @branch ||= File.open(@git + HEAD).read.scan(/ref: refs\/heads\/(.*)/)
  end

  #
  # Name of the submodule
  #
  def to_s
    @root.basename
  end

  #
  # Checkout given branch
  # +branch+ the name of the branch to check out
  def checkout(branch)
    Dir.chdir @root do
      `git checkout #{branch}`
    end
  end

  #
  # Returns the last log entry of the submodule
  #
  def last_log
    Dir.chdir @root do
      `git log -1 --format=oneline | awk '{ $1=""; print $0 }'`
    end
  end

  #
  # Returns the status of the submodule
  #
  def status
    Dir.chdir @root do
      status = `git status | head -n 2 | tail -n 1 | sed -e 's/# //g'`
      
    end
  end

end
class Project

  attr_reader :root, :submodules, :extensions, :plugins

  #
  # Initialize a radiant project:
  # * Find project root
  # * Find submodules
  #
  def initialize
    @root = Project.find_radiant_root(Pathname.pwd)
    @submodules = find_submodules
    @extensions = @submodules.select { |s| s.extension? }
    @plugins =  @submodules.select { |s| s.plugin? }
  end

  def extensions?
    !@extensions.empty?
  end
  
  def plugins?
    !@plugins.empty?
  end
  
  def to_s
    @root.basename
  end

  private

    #
    # Traverses the actual directory up until it finds the radiant root or
    # throws an execption if the file system root has been reached without
    # finding the radiant root.
    #
    def self.find_radiant_root(directory=Pathname.new($0))

      # check for radiant initializer in the environment file
      env_file = directory + 'config/environment.rb'
      return directory if File.exists?(env_file) &&
                     File.open(env_file).grep(/Radiant::Initializer/)

      if directory.root?
        puts 'Error: Subito has to run inside a Radiant project!'
        exit 1
      end
      
      # search parent directory
      return Project.find_radiant_root(Pathname.new(directory).parent)
    end

    #
    # Returns all submodules of the radiant project
    #
    def find_submodules
      Dir.chdir(@root) do
        return Dir.glob('**/.git').reject{|p| p == '.git'}.collect{|p| Submodule.new(@root + p) }
      end
    end

end
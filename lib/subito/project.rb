class Project

  attr_reader :root, :submodules, :extensions, :plugins, :radiant, :radiant_plugins

  ENVIRONMENT = 'config/environment.rb'
  
  #
  # Initialize a rails/radiant project:
  # * Find project root
  # * Find submodules and classify by type
  #
  def initialize
    @root = Project.find_rails_root(Pathname.pwd)
    @submodules = find_submodules
    @extensions = @submodules.select { |s| s.extension? }
    @plugins =  @submodules.select { |s| s.plugin? && !s.radiant_vendor? }
    @radiant =@submodules.select { |s| s.radiant? }
    @radiant_plugins = @submodules.select { |s| s.plugin? && s.radiant_vendor? }
  end

  #
  # Does the project has any extensions as submodule installed?
  #
  def extensions?
    !@extensions.empty?
  end
  
  #
  # Does the project has any plugins as submodule installed?
  #
  def plugins?
    !@plugins.empty?
  end

  #
  # Does the project has any plugins in vendor/radiant as submodule installed?
  #
  def radiant_plugins?
    !@radiant_plugins.empty?
  end
    
  #
  # Is it a radiant project
  #
  def radiant?
    File.open(@root + ENVIRONMENT).grep(/Radiant::Initializer/) do |line|
      return true
    end
    false
  end
  
  #
  # Name of the project
  # 
  def to_s
    @root.basename
  end

  private

    #
    # Traverses the actual directory up until it finds the rails root.
    # Exits if the file system root has been reached.
    #
    def self.find_rails_root(directory)

      # check for radiant initializer in the environment file
      env_file = directory + ENVIRONMENT
      return directory if File.exists?(env_file)

      if directory.root?
        puts 'Error: Subito has to run inside a Rails or Radiant project!'
        exit 1
      end
      
      # search parent directory
      return Project.find_radiant_root(Pathname.new(directory).parent)
    end

    #
    # Returns all submodules of the project
    #
    def find_submodules
      Dir.chdir(@root) do
        return Dir.glob('**/.git').reject{|p| p == '.git'}.collect{|p| Submodule.new(@root + p) }
      end
    end

end
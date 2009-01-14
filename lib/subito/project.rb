class Project

  attr_reader :root, :submodules

  #
  # Initialize a radiant project:
  # * Find project root
  # * Find submodules
  #
  def initialize
    @root = Project.find_radiant_root(Pathname.new('/Users/michi/Repositories/extranett/vendor/extensions'))
    @submodules = find_submodules
  end

  def to_s
    @root
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


      raise "Not a Radiant project" if directory.root?

      # search parent
      return Project.find_radiant_root(Pathname.new(directory).parent)
    end

    #
    # Returns all submodules of the radiant project
    #
    def find_submodules
      Dir.chdir(@root) do
        return Dir.glob('**/.git').reject{|p| p == '.git'}.collect{|p| Submodule.new(p) }
      end
    end

end
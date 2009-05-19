class Fix

  #
  # Fix the no branch warning when currently no branch
  # is selected in some submodules
  #   +project+ the project to install its bundle
  #
  def self.no_branch(project)
      project.submodules.each do |submodule|
        if submodule.branch.empty?
          puts "***".blue + "Fix submodule ".dark_green + "'#{submodule.to_s}'".yellow
          submodule.checkout(:master)
        end

    end

  end

end
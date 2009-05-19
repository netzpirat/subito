require 'rubygems'
require 'thor'
require 'pathname'
require 'subito/project'
require 'subito/submodule'
require 'helper/tree'
require 'helper/string'
require 'helper/bundle'
require 'helper/fix'

class Subito < Thor

  #
  # Shows a tree of the project submodule configuration
  # * --verbose prints more information: project type, remote URI's
  # * --remotes prints the remotes of each subproject
  #
  desc 'show', 'shows all submodules'
  method_options :verbose => :boolean, :remotes => :boolean
  def show
    Tree.show(Project.new, options)
  end

  #
  # Shows a tree of the project submodule and its last log entry
  # * --verbose prints more information: project type, remote URI's
  # * --remotes prints the remotes of each subproject its last log entry
  #
  desc 'log', 'shows all submodules last log entry'
  method_options :verbose => :boolean, :remotes => :boolean
  def log
    Tree.log(Project.new, options)
  end

  #
  # Shows a tree of the project submodule and its status
  # * --verbose prints more information: project type, remote URI's
  # * --remotes prints the remotes of each subproject and its status
  #
  desc 'status', 'shows all submodule commit status'
  method_options :verbose => :boolean, :remotes => :boolean
  def status
    Tree.status(Project.new, options)
  end

  #
  # Handles bundles
  # * generate - saves a new bundle from the actual project configuration
  # * install - loads a bundle and installs missing parts
  #
  desc 'bundle', 'generate and install bundle'
  method_options :verbose => :boolean, :remotes => :boolean
  def bundle(action = '')
    if action == 'generate'
      Bundle.generate(Project.new, options)
      
    elsif action == 'install'
      Bundle.install(Project.new, options)
      
    else
      puts "`bundle' was called incorrectly. Call as `bundle (install|generate) [--remotes] [--verbose]'"
    end
  end

  #
  # Fixes missing branches
  #
  desc 'fix', 'checkout master where no branch is currently selected'
  def fix
    Fix.no_branch(Project.new)
  end
end
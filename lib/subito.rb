require 'rubygems'
require 'thor'
require 'pathname'
require 'subito/project'
require 'subito/submodule'
require 'helper/tree'

class Subito < Thor

  desc 'show', 'shows all submodules'
  method_options :verbose => :boolean
  def show
    Tree.show(Project.new, options)
  end

end
require "rubygems"
require "simpleconsole"
require 'pathname'
require "subito/project"
require "subito/submodule"

class Controller < SimpleConsole::Controller

  before_filter :locate_project

  def default
  end

  def status
  end

  private

    def locate_project
      @project = Project.new
    end

end

class View < SimpleConsole::View

  def default
    puts @message
  end

  def status
    @project.submodules.each do |s|
      puts s
    end
  end

end
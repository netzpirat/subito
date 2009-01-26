require 'rubygems'
require 'thor'
require 'pathname'
require 'subito/project'
require 'subito/submodule'

class Subito < Thor

  desc 'show', 'shows all submodules'
  def show
    project = Project.new
    puts project.to_s
    
    if project.extensions?
      puts '+-extension'
      project.extensions.each do |extension|
        puts "  +-#{extension.to_s}"
      end
    end

    if project.plugins?
      puts '+-plugin'
      project.plugins.each do |plugin|
        puts "  +-#{plugin.to_s}"
      end
    end
  end

end
require 'rake'
 
$LOAD_PATH.unshift('lib')
 
gem 'git'
require 'git'
 
begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "subito"
    gem.summary = "Submodule Inspection Tool"
    gem.email = "michi@netzpiraten.ch"
    gem.homepage = "http://github.com/netzpirat/subito"
    gem.description = "helps to manage your Radiant extensions and Rails Plugins"
    gem.authors = ["Michael Kessler"]
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install jeweler"
end
 
require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'jeweler'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{subito}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Kessler"]
  s.date = %q{2009-07-14}
  s.default_executable = %q{subito}
  s.description = %q{helps to manage your Radiant extensions and Rails Plugins}
  s.email = %q{michi@netzpiraten.ch}
  s.executables = ["subito"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "TODO",
     "VERSION",
     "bin/subito",
     "lib/helper/bundle.rb",
     "lib/helper/fix.rb",
     "lib/helper/string.rb",
     "lib/helper/tree.rb",
     "lib/subito.rb",
     "lib/subito/project.rb",
     "lib/subito/submodule.rb"
  ]
  s.homepage = %q{http://github.com/netzpirat/subito}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Submodule Inspection Tool}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

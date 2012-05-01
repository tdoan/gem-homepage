# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "gem-homepage"
  s.version     = "0.0.5"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tony Doan"]
  s.email       = ["tdoan@tdoan.com"]
  s.homepage    = "http://github.com/tdoan/gem-homepage"
  s.summary     = "Open the homepage of a gem"
  s.description = s.summary

  s.files         = ['lib/rubygems_plugin.rb','lib/rubygems/commands/homepage_command.rb']
  s.require_paths = ["lib"]
  s.add_dependency('launchy')
end

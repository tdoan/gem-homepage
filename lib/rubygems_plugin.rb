$:.push File.expand_path("../lib", __FILE__)
require "rubygems/command_manager"
require "rubygems/commands/homepage_command"

Gem::CommandManager.instance.register_command :homepage

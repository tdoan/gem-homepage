require 'launchy'
class Gem::Commands::HomepageCommand < Gem::Command
  def description
    "Open the homepage for this gem"
  end
  
  def arguments
    "GEM    gem's name"
  end
  
  def usage
    "#{program_name} GEM"
  end
  
  def initialize
    super "homepage", description
  end
  
  def execute
    gemname = options[:args].first
    unless gemname
      say "Usage: #{usage}"
      return terminate_interaction
    end
    dep = Gem::Dependency.new(gemname)
    $stderr.puts "Made dep"
    spec = Gem.source_index.search(dep).first
    $stderr.puts "spec: #{spec.inspect}"
    if spec
      $stderr.puts "found a spec"
      Launchy.open(spec.homepage)
    else
      say "The #{gemname.inspect} gem couldn't be found"
      return terminate_interaction
    end
  end
end

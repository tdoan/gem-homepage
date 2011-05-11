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
    if Gem::Specification.respond_to? :find_all_by_name
      spec = Gem::Specification.find_all_by_name(gemname).first
    else
      dep = Gem::Dependency.new(gemname)
      spec = Gem.source_index.search(dep).first
    end
    if spec
      Launchy.open(spec.homepage)
    else
      say "The #{gemname.inspect} gem couldn't be found"
      return terminate_interaction
    end
  end
end

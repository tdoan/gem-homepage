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
    dep = Gem::Dependency.new(gemname,"> 0")
    if Gem::Specification.respond_to? :find_all_by_name
      spec = Gem::Specification.find_all_by_name(gemname).first
    else
      spec = Gem.source_index.search(dep).first
    end
    if spec.nil?
    #try remote if you didn't find it locally
      fetcher = Gem::SpecFetcher.fetcher
      t = fetcher.fetch(dep).first
      spec = t.first if t
    end
    if spec
      if spec.homepage and spec.homepage != ""
        Launchy.open(spec.homepage)
      else
        say "No homepage listed in the gemspec for this gem."
        return terminate_interaction
      end
    else
      say "The #{gemname.inspect} gem couldn't be found"
      return terminate_interaction
    end
  end
end

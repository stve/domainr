require 'rubygems'
require 'rake'

$:.unshift('lib')

begin
  require 'jeweler'
  require 'domainr/version'
  Jeweler::Tasks.new do |gem|
    gem.name = "domainr"
    gem.summary = %Q{Ruby wrapper for the Domainr API}
    gem.description = %Q{Ruby wrapper for the Domainr API}
    gem.email = "steve.agalloco@gmail.com"
    gem.homepage = "http://github.com/spagalloco/domainr"
    gem.authors = ["Steve Agalloco"]
    
    gem.add_dependency(%q<httparty>, [">= 0.5.2"])
    gem.add_dependency(%q<hashie>, [">= 0.2.0"])
    
    gem.add_development_dependency "shoulda", ">= 0"
    gem.add_development_dependency "fakeweb", ">= 0"
    gem.add_development_dependency 'redgreen', ">= 0"
    
    gem.version = Domainr::VERSION
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "domainr #{Domainr::VERSION}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

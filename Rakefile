require 'rspec/core/rake_task'
require 'rdoc'
require 'sdoc'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "generate docs"
task :doc do
  `sdoc`
end
Gem::Specification.new do |s|
  s.name        = 'ft-poc'
  s.version     = '0.0.2'
  s.date        = '2014-05-16'
  s.summary     = "FilesTube cmdline search"
  s.description = "A simple POC script to search FilesTube from the command line"
  s.authors     = ["Adam Ladachowski"]
  s.email       = 'adam@saiden.pl'
  s.files       = ["bin/ft-poc","lib/ft-poc.rb"]
  s.executables = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.homepage    =
    'https://github.com/aladac/ft-poc'
  s.license       = 'MIT'
  s.add_runtime_dependency "crack", "~> 0.4"
  s.add_runtime_dependency "curb", "~> 0.8"
  s.add_runtime_dependency "addressable", "~> 2.3"
end
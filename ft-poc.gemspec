Gem::Specification.new do |s|
  s.name        = 'ft-poc'
  s.version     = '0.0.1'
  s.date        = '2014-05-16'
  s.summary     = "FilesTube cmdline search"
  s.description = "A simple POC script to search FilesTube from the command line"
  s.authors     = ["Adam Ladachowski"]
  s.email       = 'adam@saiden.pl'
  s.files       = ["bin/ft-poc","etc/ft-poc.yml"]
  s.homepage    =
    'https://github.com/aladac/ft-poc'
  s.license       = 'MIT'
  s.add_runtime_dependency = "crack"
  s.add_runtime_dependency = "curb"
  s.add_runtime_dependency = "addressable"
end
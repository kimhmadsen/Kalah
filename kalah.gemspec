# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kalah/version'

Gem::Specification.new do |s|
  s.name        = 'kalah'
  s.version     = Kalah::VERSION
  s.date        = '2014-02-02'
  s.summary     = "A simple Kalah game engine."
  s.description = "Kalah is a Ruby based Kalah/Kalaha/Mancala engine. Useful for making intelligent game agents or interactive Kalah games. Flexible in terms of board structure."
  s.authors     = ["Mads Kalør", "Kim H. Madsen"]
  s.email       = 'mads@kaloer.com'
  s.files       = ["lib/kalah.rb"]
  s.homepage    =
    'https://github.com/mKaloer/Kalah'
  s.license       = 'MIT'
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.13"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "minitest", "~> 5.0"
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "coffee-cup"
  s.version     = "0.0.2"
  s.authors     = ["Sebastien Rosa"]
  s.email       = ["sebastien@demarque.com"]
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.licenses    = ["MIT"]
  s.homepage    = "https://github.com/demarque/coffee-cup"
  s.summary     = "Coffee Cup set the foundations of a Rails like structure for your all your CoffeeScript code."
  s.description = "Coffee Cup set the foundations of a Rails like structure for your all your CoffeeScript code."

  s.rubyforge_project = "coffee-cup"

  s.files         = Dir.glob('{app,lib,spec}/**/*') + %w(LICENSE README.md Rakefile Gemfile)
  s.require_paths = ["lib"]

  s.add_development_dependency('rake', ['>= 0.8.7'])
  s.add_development_dependency('rspec', ['>= 2.0'])
  s.add_development_dependency('metrical', ['>= 0.1.0'])
end

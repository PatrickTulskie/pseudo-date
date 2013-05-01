# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pseudo_date/version'

Gem::Specification.new do |gem|
  gem.name          = "pseudo_date"
  gem.version       = PseudoDate::VERSION
  gem.authors       = ["Patrick Tulskie"]
  gem.email         = ["patricktulskie@gmail.com"]
  gem.description   = %q{Date parser and container for partial or incomplete dates.}
  gem.summary       = %q{Date parser and container for partial or incomplete dates.}
  gem.homepage      = "http://github.com/PatrickTulskie/pseudo_date"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_development_dependency("rspec")
end

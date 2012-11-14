# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sortables/version'

Gem::Specification.new do |gem|
  gem.name          = "sortables"
  gem.version       = Sortables::VERSION
  gem.authors       = ["Joe Sak"]
  gem.email         = ["joe@neotericdesign.com"]
  gem.description   = %q{Easily add sorting by an integer field on your ActiveRecord models}
  gem.summary       = %q{(hopefully) painless positional sorting}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'activerecord', '3.2.9'
  gem.add_development_dependency 'sqlite3'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'database_cleaner'
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'translatable/version'

Gem::Specification.new do |gem|
  gem.name          = "translatable"
  gem.version       = Translatable::VERSION
  gem.authors       = ["antho1404"]
  gem.email         = ["anthony.estebe@gmail.com"]
  gem.description   = %q{Translate a simple attribute in all your locales }
  gem.summary       = %q{This is similar to most of other translation plugin in rails but usefull if you want to translate in few language because we don't need any join like others plugins. }
  gem.homepage      = "https://github.com/antho1404/translatable"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

# @author Sachin Singh
# -*- encoding: utf-8 -*-
require File.expand_path('../lib/autotab-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Sachin Singh']
  gem.email         = ['sachin.y87@hmail.com']
  gem.description   = %q{AutoTab is a is a jQuery plugin that provides auto tabbing and filtering on text fields in a form.}
  gem.summary       = %q{Integrate AutoTab javascript library with Rails asset pipeline}
  gem.homepage      = 'https://github.com/sachin87/autotab-rails'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'autotab-rails'
  gem.require_paths = ['lib']
  gem.version       = AutoTab::Rails::VERSION

  gem.add_dependency 'railties', '>= 3.0'

  gem.add_development_dependency 'bundler', '>= 1.0'
  gem.add_development_dependency 'rails', '>= 3.0'
  gem.add_development_dependency 'thor', '>= 0.14'
end

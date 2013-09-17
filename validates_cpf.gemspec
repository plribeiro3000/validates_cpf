# -*- encoding: utf-8 -*-
require File.expand_path('../lib/validates_cpf/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'validates_cpf'
  gem.version     = ValidatesCpf::VERSION
  gem.authors     = %q{Paulo Henrique Lopes Ribeiro}
  gem.email       = %q{plribeiro3000@gmail.com}
  gem.summary     = %q{Validates CPF and test it with matchers in a simple way.}

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features,examples,gemfiles}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = %w(lib)

  gem.license = 'MIT'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'shoulda-matchers', '2.0.0'
  gem.add_development_dependency 'coveralls'

  gem.add_runtime_dependency 'activemodel'
end
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_cpf/version"

Gem::Specification.new do |s|
  s.name        = "validates_cpf"
  s.version     = ValidatesCpf::VERSION
  s.authors     = ["Paulo Henrique Lopes Ribeiro"]
  s.email       = %q{plribeiro3000@gmail.com}
  s.homepage    = ""
  s.summary     = %q{CPF Validation GEM}
  s.description = %q{Validates CPF, the simple way.}

  s.rubyforge_project = "validates_cpf"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_development_dependency "rspec"
end
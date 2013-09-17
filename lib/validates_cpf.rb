require 'cpf_validator'
require 'require_a_valid_cpf_matcher' if defined?(::Shoulda)

module ValidatesCpf
  autoload :Cpf, 'validates_cpf/cpf'
end
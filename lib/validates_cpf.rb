# frozen_string_literal: true

require 'validates_cpf/cpf_validator'
require 'validates_cpf/require_a_valid_cpf_matcher' if defined?(::Shoulda)

module ValidatesCpf
  autoload :Cpf, 'validates_cpf/cpf'
end

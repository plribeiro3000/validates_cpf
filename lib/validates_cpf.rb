require "validates_cpf/version"
require "validates_cpf/cpf"

class CPFValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || :invalid) unless CPF.valid?(value)
  end
end
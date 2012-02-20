require "active_model"
require "validates_cpf/version"
require "validates_cpf/cpf"

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || :invalid) unless CPF.new(value).valid?
  end
end
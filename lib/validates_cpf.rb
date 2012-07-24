require "validates_cpf/cpf"

#Rspec Matchers
require "validates_cpf/shoulda-matchers/require_a_valid_cpf_matcher" if defined?(::Shoulda)
require "validates_cpf/remarkable/require_a_valid_cpf_matcher" if defined?(::Remarkable)

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t("errors.messages.invalid") unless CPF.new(value).valid?
  end
end
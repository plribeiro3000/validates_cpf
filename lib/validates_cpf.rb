require "active_model"
require "validates_cpf/cpf"
require "shoulda-matchers/validate_as_cpf_matcher" if defined?(Shoulda)
require "remarkable/validate_as_cpf_matcher" if defined?(Remarkable)

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << I18n.t("errors.messages.invalid") unless CPF.new(value).valid?
  end
end
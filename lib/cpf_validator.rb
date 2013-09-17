class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid, options) unless ValidatesCpf::Cpf.new(value).valid?
  end
end

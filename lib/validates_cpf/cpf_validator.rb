# frozen_string_literal: true

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cpf = ValidatesCpf::Cpf.new(value)

    if cpf.valid?
      record.send("#{attribute}=", cpf.number) if options[:mask]
    else
      record.errors.add(attribute, :invalid, options)
    end
  end
end

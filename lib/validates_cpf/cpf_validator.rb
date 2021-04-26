# frozen_string_literal: true

class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cpf = ValidatesCpf::Cpf.new(value)

    if cpf.valid?
      record.send("#{attribute}=", cpf.number) if options[:mask]
    else
      ruby_prior_version_three =
        Gem::Version.new(RUBY_VERSION) < Gem::Version.new('3.0.0')

      if ruby_prior_version_three
        record.errors.add(attribute, :invalid, options)
      else
        record.errors.add(attribute, :invalid, **options)
      end
    end
  end
end

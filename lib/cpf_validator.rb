class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    key = :"activerecord.errors.models.#{record.class.name.underscore}.attributes.#{attribute}.invalid"
    record.errors[attribute] << I18n.t(key, :default => :'activerecord.errors.messages.invalid') unless ValidatesCpf::Cpf.new(value).valid?
  end
end
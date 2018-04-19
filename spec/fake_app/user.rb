# frozen_string_literal: true

class User
  include ActiveModel::Model

  attr_accessor :cpf, :masked_cpf, :name

  validates :cpf, cpf: true
  validates :masked_cpf, cpf: { mask: true }
end

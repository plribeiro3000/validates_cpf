class User < ActiveRecord::Base
  validates :cpf, :cpf => true
end
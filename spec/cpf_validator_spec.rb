# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CpfValidator do
  let(:user) { User.new }

  context 'with invalid cpf' do
    before do
      user.cpf = '12345'
      I18n.stub(:t).with(:'activerecord.errors.models.user.attributes.cpf.invalid',
                         default: :'activerecord.errors.messages.invalid').and_return('is invalid')
      user.valid?
    end

    it 'invalidates the object' do
      expect(user).not_to be_valid
    end

    it 'sets an error message' do
      expect(user.errors[:cpf]).to match(['is invalid'])
    end
  end

  context 'with valid cpf' do
    before do
      user.cpf = '11144477735'
      user.valid?
    end

    it 'validates the object' do
      expect(user).to be_valid
    end

    it 'does not set an error message' do
      expect(user.errors[:cpf]).to be_blank
    end
  end

  context 'with nil value' do
    before { user.cpf = nil }

    it 'validates the object' do
      expect(user).to be_valid
    end

    it 'does not set an error message' do
      expect(user.errors[:cpf]).to be_blank
    end
  end
end

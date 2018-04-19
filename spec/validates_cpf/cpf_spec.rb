# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesCpf::Cpf do
  let(:user) { User.new }

  it 'rejects 345.65.67.3' do
    expect(ValidatesCpf::Cpf.new('345.65.67.3')).not_to be_valid
  end

  it 'rejects 567.765-87698' do
    expect(ValidatesCpf::Cpf.new('567.765-87698')).not_to be_valid
  end

  it 'rejects 345456-654-01' do
    expect(ValidatesCpf::Cpf.new('345456-654-01')).not_to be_valid
  end

  it 'rejects 123456' do
    expect(ValidatesCpf::Cpf.new('123456')).not_to be_valid
  end

  it 'rejects 23342345699' do
    expect(ValidatesCpf::Cpf.new('23342345699')).not_to be_valid
  end

  it 'rejects 34.543.567-98' do
    expect(ValidatesCpf::Cpf.new('34.543.567-98')).not_to be_valid
  end

  it 'rejects 456.676456-87' do
    expect(ValidatesCpf::Cpf.new('456.676456-87')).not_to be_valid
  end

  it 'rejects 333333333-33' do
    expect(ValidatesCpf::Cpf.new('333333333-33')).not_to be_valid
  end

  it 'rejects 00000000000' do
    expect(ValidatesCpf::Cpf.new('00000000000')).not_to be_valid
  end

  it 'rejects 000.000.000-00' do
    expect(ValidatesCpf::Cpf.new('000.000.000-00')).not_to be_valid
  end

  it 'rejects 111.444.777-3500' do
    expect(ValidatesCpf::Cpf.new('111.444.777-3500')).not_to be_valid
  end

  it 'rejects 11144477735AB' do
    expect(ValidatesCpf::Cpf.new('11144477735AB')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(ValidatesCpf::Cpf.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(ValidatesCpf::Cpf.new(nil)).to be_valid
  end

  it 'accepts 111.444.777-35' do
    expect(ValidatesCpf::Cpf.new('111.444.777-35')).to be_valid
  end

  it 'accepts 11144477735' do
    expect(ValidatesCpf::Cpf.new('11144477735')).to be_valid
  end

  it 'accepts 111.444777-35' do
    expect(ValidatesCpf::Cpf.new('111.444777-35')).to be_valid
  end

  it 'accepts 111444.777-35' do
    expect(ValidatesCpf::Cpf.new('111444.777-35')).to be_valid
  end

  it 'accepts 111.444.77735' do
    expect(ValidatesCpf::Cpf.new('111.444.77735')).to be_valid
  end

  context 'with a valid value on not masked attribute' do
    before do
      user.cpf = '11144477735'
      user.valid?
    end

    it 'leaves the original value' do
      expect(user.cpf).to eq('11144477735')
    end
  end

  context 'with a valid value on masked attribute' do
    before do
      user.masked_cpf = '11144477735'
      user.valid?
    end

    it 'masks the original value' do
      expect(user.masked_cpf).to eq('111.444.777-35')
    end
  end

  context 'with an invalid value' do
    before do
      user.cpf = '123456'
      user.valid?
    end

    it 'leaves the original value' do
      expect(user.cpf).to eq('123456')
    end
  end
end

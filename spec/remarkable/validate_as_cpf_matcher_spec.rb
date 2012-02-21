require 'spec_helper'
require 'remarkable/active_record'

describe Remarkable::ActiveRecord::Matchers::ValidateAsCpfMatcher do
  context "on a attribute which validates cpf" do
    it "should require a valid CPF" do
      @user = User.new(:cpf => '123456')
      @user.should validate_as_cpf(:cpf)
    end

    it "should allow a nil value" do
      @user = User.new(:cpf => nil)
      @user.should validate_as_cpf(:cpf)
    end
  end

  context "on a attribute which not validates cpf" do
    before do
      @user = Admin.new(:cpf => '123456')
    end

    it "should not require a valid CPF" do
      @user.should_not validate_as_cpf(:cpf)
    end
  end
end
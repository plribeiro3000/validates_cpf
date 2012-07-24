require 'spec_helper'
require 'remarkable/active_model'

describe Remarkable::ActiveModel::Matchers::RequireAValidCpfMatcher do
  before :each do
    @user = User.new
  end

  it "should accept on cpf" do
    @user.should require_a_valid_cpf(:cpf)
  end

  it "should accept without a specified attribute" do
    @user.should require_a_valid_cpf
  end

  it "should reject on name" do
    @user.should_not require_a_valid_cpf(:name)
  end
end
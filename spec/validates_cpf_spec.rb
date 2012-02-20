require 'spec_helper'

describe CpfValidator do
  context "when cpf is invalid" do
    before :each do
      @user = User.new(:cpf => "12345")
    end

    it "should set object as invalid" do
      @user.valid?.should be_false
    end

    it "should set an error on attribute" do
      @user.valid?
      @user.errors[:cpf].should == ['is invalid']
    end
  end

  context "when cpf is valid" do
    before :each do
      @user = User.new(:cpf => "11144477735")
    end

    it "should set object as valid" do
      @user.valid?.should be_true
    end

    it "should not set an error on attribute" do
      @user.valid?
      @user.errors[:cpf].should be_blank
    end
  end

  it "should accept a nil value" do
    @user = User.new(:cpf => nil)
    @user.valid?.should be_true
  end
end
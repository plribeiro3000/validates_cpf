require 'spec_helper'

require File.expand_path(File.dirname(__FILE__) + "/../../lib/validates_cpf/cpf")

describe CPF do
  context "should be invalid with" do
    it "blank number" do
      CPF.new('').should_not be_valid
    end

    it "345.65.67.3 as number" do
      CPF.new('345.65.67.3').should_not be_valid
    end

    it "567.765-87698 as number" do
      CPF.new('567.765-87698').should_not be_valid
    end

    it "345456-654-01 as number" do
      CPF.new('345456-654-01').should_not be_valid
    end

    it "123456 as number" do
      CPF.new('123456').should_not be_valid
    end

    it "23342345699 as number" do
      CPF.new('23342345699').should_not be_valid
    end

    it "34.543.567-98 as number" do
      CPF.new('34.543.567-98').should_not be_valid
    end

    it "456.676456-87 as number" do
      CPF.new('456.676456-87').should_not be_valid
    end

    it "333333333-33 as number" do
      CPF.new('333333333-33').should_not be_valid
    end

    it "00000000000 as number" do
      CPF.new('00000000000').should_not be_valid
    end

    it "000.000.000-00 as number" do
      CPF.new('000.000.000-00').should_not be_valid
    end

    it "111.444.777-3500 as number" do
      CPF.new('111.444.777-3500').should_not be_valid
    end

    it "11144477735AB as number" do
      CPF.new('11144477735AB').should_not be_valid
    end
  end

  context "should be valid with" do
    it "nil as number" do
          CPF.new(nil).should be_valid
    end

    it "111.444.777-35 as number" do
      CPF.new('111.444.777-35').should be_valid
    end

    it "11144477735 as number" do
      CPF.new('11144477735').should be_valid
    end

    it "111.444777-35 as number" do
      CPF.new('111.444777-35').should be_valid
    end

    it "111444.777-35 as number" do
      CPF.new('111444.777-35').should be_valid
    end

    it "111.444.77735 as number" do
      CPF.new('111.444.77735').should be_valid
    end
  end

  context "with a valid value" do
    it "should return it formatted" do
      CPF.new('11144477735').number.should == '111.444.777-35'
    end
  end

  context "with an invalid value" do
    it "should return as it was" do
      CPF.new('123456').number.should == '123456'
    end
  end
end
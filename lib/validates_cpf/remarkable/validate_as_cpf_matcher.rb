require 'remarkable/active_record'

module Remarkable
  module ActiveRecord
    module Matchers
      class ValidateAsCpfMatcher < Remarkable::ActiveRecord::Base
        arguments :cpf

        collection_assertions :cpf_valid?, :allow_nil?, :formatted_number?

        protected

        def cpf_valid?
          @subject.cpf = '123456'
          @subject.valid?.errors[:cpf].should == ['is invalid']
        end

        def allow_nil?
          @subject.cpf = nil
          @subject.valid?.errors[:cpf].should == []
        end

        def formatted_number?
          @subject.cpf = '55658208394'
          @subject.valid?.cpf.should == '556.582.083-94'
        end
      end

      def validate_as_cpf(*args, &block)
        ValidateAsCpfMatcher.new(*args, &block).spec(self)
      end
    end
  end
end
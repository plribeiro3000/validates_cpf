require 'remarkable/active_model'

module Remarkable
  module ActiveModel
    module Matchers
      class RequireAValidCpfMatcher < Remarkable::ActiveModel::Base
        arguments :cpf

        collection_assertions :disallow_invalid_value, :allow_valid_value

        protected

        def disallow_invalid_value
          @subject.cpf = '123456'
          @subject.valid?.errors[:cpf].should == ['is invalid']
        end

        def allow_valid_value
          @subject.cpf = '764.579.437-21'
          @subject.valid?.errors[:cpf].should == []
        end
      end

      def require_a_valid_cpf(*args, &block)
        RequireAValidCpfMatcher.new(*args, &block).spec(self)
      end
    end
  end
end
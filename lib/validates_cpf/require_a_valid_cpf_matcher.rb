require 'shoulda-matchers'
require 'active_support/core_ext/array/wrap'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_cpf(attr = :cpf)
        RequireAValidCpfMatcher.new(attr)
      end

      class RequireAValidCpfMatcher < ValidationMatcher
        def description
          'require a valid CPF number'
        end

        def matches?(subject)
          @subject = subject
          disallows_value_of('123456') && allows_value_of('897.546.112-20')
        end
      end
    end
  end
end
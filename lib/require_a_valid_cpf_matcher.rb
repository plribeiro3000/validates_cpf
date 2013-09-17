require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_cpf(attr = :cpf)
        RequireAValidCpfMatcher.new(attr)
      end

      class RequireAValidCpfMatcher < ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
        end

        def description
          'require a valid CPF number'
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value
        end

        private

        def disallows_invalid_value
          disallows_value_of('123456')
        end

        def allows_valid_value
          allows_value_of('897.546.112-20')
        end
      end
    end
  end
end
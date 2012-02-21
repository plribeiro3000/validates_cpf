require "shoulda-matchers"

module Shoulda
  module Matchers
    module ActiveModel
      def validate_as_cpf(attr)
        ValidateAsCpfMatcher.new(attr)
      end

      class ValidateAsCpfMatcher < ValidationMatcher
        def initialize(attribute)
          @attribute = attribute
        end

        def description
          "validate #{@attribute} as a valid CPF number"
        end

        def failure_message
          "expected #{@attribute} to be validated as a valid CPF number"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value and allows_valid_value and allows_nil_value
        end

        private

        def disallows_invalid_value
          disallows_value_of("123456")
        end

        def allows_valid_value
          allows_value_of("897.546.112-20")
        end

        def allows_nil_value
          allows_value_of(nil)
        end
      end
    end
  end
end
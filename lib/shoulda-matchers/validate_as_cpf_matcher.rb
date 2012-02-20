module Shoulda
  module Matchers
    module ActiveModel
      def validate_as_cpf(attr)
        ValidateAsCpfMatcher.new(attr)
      end

      class ValidateAsCpfMatcher < ValidationMatcher
        include Helpers

        def initialize(attribute)
          @attribute = attribute
        end

        def with_message(message)
          @message = message if message
          self
        end

        def description
          "validate #{@attribute} as a valid CPF number"
        end

        def matches?(subject)
          super(subject)

          disallows_invalid_value &&
              allows_valid_value &&
              allows_nil_value
        end

        private

        def disallows_invalid_value
          disallows_value_of("123456", @message)
        end

        def allows_valid_value
          allows_value_of("897.546.112-20", @message)
        end

        def allows_nil_value
          allows_value_of(nil, @message)
        end
      end
    end
  end
end
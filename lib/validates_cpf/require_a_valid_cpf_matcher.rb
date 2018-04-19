# frozen_string_literal: true

require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def require_a_valid_cpf(attr = :cpf)
        RequireAValidCpfMatcher.new(attr)
      end

      class RequireAValidCpfMatcher < ValidationMatcher
        def description
          'requires a valid CPF'
        end

        def failure_message
          'does not require a valid CPF'
        end

        def matches?(subject)
          super(subject)
          disallows_value_of('123456') && allows_value_of('897.546.112-20')
        end
      end
    end
  end
end

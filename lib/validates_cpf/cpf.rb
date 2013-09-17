module ValidatesCpf
  class Cpf
    def initialize(number)
      number =~ /^(\d{3}\.?\d{3}\.?\d{3})-?(\d{2})$/
      @number = number
      @pure_number = $1
      @result = $2
      @cleaned_number = @pure_number.nil? ? nil : @number.gsub(/[\.-]/, "")
      format_number! if @pure_number
    end

    def valid?
      return true if @number.blank?
      return false unless @pure_number
      check_cpf
    end

    def number
      @number
    end

    private

    def check_cpf
      return false if @cleaned_number.length != 11 or @cleaned_number.scan(/\d/).uniq.length == 1
      @result == first_digit_verifier + second_digit_verifier
    end

    def first_digit_verifier
      sum = multiply_and_sum([10, 9, 8, 7, 6, 5, 4, 3, 2], @pure_number)
      digit_verifier(sum%11).to_s
    end

    def second_digit_verifier
      sum = multiply_and_sum([11, 10, 9, 8, 7, 6, 5, 4, 3, 2], @pure_number + first_digit_verifier)
      digit_verifier(sum%11).to_s
    end

    def multiply_and_sum(array, number)
      multiplied = []
      number.scan(/\d{1}/).each_with_index { |e, i| multiplied[i] = e.to_i * array[i] }
      multiplied.inject { |s,e| s + e }
    end

    def digit_verifier(rest)
      rest < 2 ? 0 : 11 - rest
    end

    def format_number!
      @cleaned_number =~ /(\d{3})(\d{3})(\d{3})(\d{2})/
      @number = "#{$1}.#{$2}.#{$3}-#{$4}"
    end
  end
end

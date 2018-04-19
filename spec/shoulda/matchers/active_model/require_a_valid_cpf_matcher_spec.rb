# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Shoulda::Matchers::ActiveModel::RequireAValidCpfMatcher do
  subject { User.new }

  it { is_expected.to require_a_valid_cpf(:cpf) }
  it { is_expected.to require_a_valid_cpf }
  it { is_expected.not_to require_a_valid_cpf(:name) }
end

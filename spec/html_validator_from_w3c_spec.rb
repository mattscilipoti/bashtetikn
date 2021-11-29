# frozen_string_literal: true

require_relative "shared/shared_html_validator_specs"
require_relative "../lib/bashtetikn/html_validator_from_w3c"

RSpec.describe Bashtetikn::HtmlValidatorFromW3C do
  let(:validator) { described_class.new }

  it "#underlying_validator is a W3CValidators::NuValidator" do
    expect(validator.underlying_validator).to be_a(W3CValidators::NuValidator)
  end

  it_behaves_like "an html validator"
end

# frozen_string_literal: true

require_relative "shared/shared_html_validator_specs"
require_relative "../lib/bashtetikn/html_validator_from_w3c"

RSpec.describe Bashtetikn::HtmlValidatorFromW3C do
  let(:validator) { Bashtetikn::HtmlValidatorFromW3C.new }

  it "#validator is a W3CValidators::NuValidator" do
    expect(subject.validator).to be_a(W3CValidators::NuValidator)
  end

  it_should_behave_like "an html validator"
end

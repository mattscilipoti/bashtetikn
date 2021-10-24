# frozen_string_literal: true

require_relative "shared/shared_html_validator_specs"
require_relative "../lib/bashtetikn/html_validator"

RSpec.describe Bashtetikn::HtmlValidator do
  let(:validator) { Bashtetikn::HtmlValidator.new }

  it "#underlying_validator is a W3CValidators::NuValidator" do
    expect(subject.underlying_validator).to be_a(W3CValidators::NuValidator)
  end

  it_should_behave_like "an html validator"
end

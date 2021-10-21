# frozen_string_literal: true

require_relative "shared/shared_html_validator_specs"

EXPECTED_VERSION = "0.1.0"

# NOTE: you must install the gem locally before running these, via:
# - `rake build`
# - `gem install pkg/bashtetikn-#{EXPECTED_VERSION}.gem`

RSpec.describe "The installed gem (#{EXPECTED_VERSION})" do
  # test the built, installed gem
  gem "bashtetikn", EXPECTED_VERSION
  require "bashtetikn"

  it "version should be #{EXPECTED_VERSION}" do
    expect(Bashtetikn::VERSION).to eql(EXPECTED_VERSION)
  end

  describe Bashtetikn::HtmlValidatorFromW3C do
    let(:validator) { Bashtetikn::HtmlValidatorFromW3C.new }

    it "#validator is a W3CValidators::NuValidator" do
      expect(subject.validator).to be_a(W3CValidators::NuValidator)
    end

    it_should_behave_like "an html validator"
  end
end

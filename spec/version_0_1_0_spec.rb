# frozen_string_literal: true

require_relative "shared/shared_html_validator_specs"

EXPECTED_VERSION = "0.1.0"

# rubocop:disable RSpec/DescribeClass
RSpec.describe "The installed gem (#{EXPECTED_VERSION})" do
  begin
    # test the built, installed gem
    gem "bashtetikn", EXPECTED_VERSION
    require "bashtetikn"
  rescue LoadError
    # NOTE: you must install the gem locally before running these, via:
    unless system("rake build") && system("gem install pkg/bashtetikn-#{EXPECTED_VERSION}.gem")
      puts "ERROR: building and installing gem. Exiting specs."
      exit 1
    end
    retry
  end

  it "version should be #{EXPECTED_VERSION}" do
    expect(Bashtetikn::VERSION).to eql(EXPECTED_VERSION)
  end

  describe Bashtetikn::HtmlValidatorFromW3C do
    let(:validator) { described_class.new }

    it "#underlying_validator is a W3CValidators::NuValidator" do
      expect(validator.underlying_validator).to be_a(W3CValidators::NuValidator)
    end

    it_behaves_like "an html validator"
  end
end
# rubocop:enable RSpec/DescribeClass

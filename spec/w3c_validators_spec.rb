# frozen_string_literal: true

require "vcr_helper"
require_relative "../lib/bashtetikn/html_validator_from_w3c"

RSpec.describe Bashtetikn::HtmlValidatorFromW3C, :vcr do
  it "#validator is a W3CValidators::NuValidator" do
    expect(subject.validator).to be_a(W3CValidators::NuValidator)
  end

  describe "#validate_text" do
    context "for empty text" do
      it "returns 2 errors" do
        validator = Bashtetikn::HtmlValidatorFromW3C.new
        results = validator.validate_text("")
        expect(results.errors.length).to eql(2)
        expect(results.errors).to all(be_a(W3CValidators::Message))
      end
    end

    context "for valid html" do
      let(:valid_fragment) do
        <<-VALID_FRAGMENT
        <!DOCTYPE html>
        <html lang="en-ca">
          <head>
            <title>HTML 5 Example</title>
          </head>
          <body>
            <p>This is a sample HTML 5 document.</p>
            <h1>Example of paragraphs</h1>
            This is the <em>first</em> paragraph in this example.
            <p>This is the second.</p>
            <p>Test<br>test</p>
          </body>
        </html>
        VALID_FRAGMENT
      end

      it "returns 0 errors" do
        validator = Bashtetikn::HtmlValidatorFromW3C.new
        results = validator.validate_text(valid_fragment)
        expect(results.errors.length).to eql(0)
      end
    end

    context "for invalid html" do
      let(:invalid_fragment) do
        <<-INVALID_FRAGMENT
        <!DOCTYPE html>
        <html lang="en-ca">
          <head>
            <title>HTML 5 Example</title>
          </head>
          <body>
            <section>Unclosed element
            <p>This is a sample HTML 5 document with an unclosed element.</p>
          </body>
        </html>
        INVALID_FRAGMENT
      end

      it "returns 2 errors" do
        validator = Bashtetikn::HtmlValidatorFromW3C.new
        results = validator.validate_text(invalid_fragment)
        expect(results.errors.length).to eql(2)
        expect(results.errors).to all(be_a(W3CValidators::Message))
      end
    end
  end

  describe "#validate_uri" do
    def assert_no_errors(response)
      expect(response.errors).to be_empty, response.errors.map { |e| e.to_s }.join(". ")
    end

    def assert_no_warnings(response)
      expect(response.warnings).to be_empty, response.warnings.map { |w| w.to_s }.join(". ")
    end

    def assert_errors(response, quantity = nil)
      case quantity
      when 0
        assert_no_errors response
      when nil
        expect(response.errors.any?).to be false
      else
        expect(response.errors.length).to eql(quantity)
      end
    end

    subject(:validator) { Bashtetikn::HtmlValidatorFromW3C.new }

    it "should validate the page" do
      # use valid page provided by w3c-validators
      r = validator.validate_uri("https://w3c-validators.github.io/w3c_validators/valid_html5.html")
      expect(r.doctype).to eql(:html5)
      expect(r.uri).to eql("https://w3c-validators.github.io/w3c_validators/valid_html5.html")
      assert_no_errors r
      assert_no_warnings r
      expect(r.validity).to be true
    end
  end
end

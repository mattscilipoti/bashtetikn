# frozen_string_literal: true

require "vcr_helper"
require "rspec/its"

RSpec.shared_examples "an html validator" do
  describe "#validate_text", vcr: true do
    context "with empty text" do
      it "returns 2 errors" do
        results = validator.validate_text("")
        expect(results.errors.length).to be(2)
      end

      it "returns W3CValidators::Messages" do
        results = validator.validate_text("")
        expect(results.errors).to all(be_a(W3CValidators::Message))
      end
    end

    context "with valid html" do
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
        results = validator.validate_text(valid_fragment)
        expect(results.errors.length).to be(0)
      end
    end

    context "with invalid html" do
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
        results = validator.validate_text(invalid_fragment)
        expect(results.errors.length).to be(2)
      end

      it "returns W3CValidators::Messages" do
        results = validator.validate_text(invalid_fragment)
        expect(results.errors).to all(be_a(W3CValidators::Message))
      end
    end
  end

  describe "#validate_uri", vcr: true do
    def assert_no_errors(response)
      expect(response.errors).to be_empty, response.errors.map(&:to_s).join(". ")
    end

    def assert_no_warnings(response)
      expect(response.warnings).to be_empty, response.warnings.map(&:to_s).join(". ")
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

    let(:validator) { Bashtetikn::HtmlValidatorFromW3C.new }

    context "with a valid page" do
      # use valid page provided by w3c-validators
      subject(:response) { validator.validate_uri(uri) }

      let(:uri) { "https://w3c-validators.github.io/w3c_validators/valid_html5.html" }

      its(:doctype) { is_expected.to be(:html5) }
      its(:uri) { is_expected.to eql(uri) }

      it "does not have errors" do
        assert_no_errors response
      end

      it "does not have warnings" do
        assert_no_warnings response
      end

      it "is valid" do
        expect(response.validity).to be true
      end
    end

    context "with an invalid page" do
      # use invalid page provided by w3c-validators
      subject(:response) { validator.validate_uri(uri) }

      let(:uri) { "https://w3c-validators.github.io/w3c_validators/invalid_html5.html" }

      its(:doctype) { is_expected.to be(:html5) }
      its(:uri) { is_expected.to eql(uri) }

      it "has 2 errors" do
        expect(response.errors.size).to eq(2)
      end

      it "does not have warnings" do
        assert_no_warnings response
      end

      it "is not valid" do
        expect(response.validity).to be false
      end
    end
  end
end

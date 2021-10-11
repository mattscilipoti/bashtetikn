# frozen_string_literal: true

require_relative "../lib/bashtetikn/page_validator_from_w3c"

RSpec.describe Bashtetikn::PageValidatorFromW3C do
  it "#validator is a W3CValidators::NuValidator" do
    expect(subject.validator).to be_a(W3CValidators::NuValidator)
  end

  describe "#validate_text" do
    context "for empty text" do
      it "returns 2 errors" do
        validator = Bashtetikn::PageValidatorFromW3C.new
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
        validator = Bashtetikn::PageValidatorFromW3C.new
        results = validator.validate_text(valid_fragment)
        expect(results.errors.length).to eql(0)
      end
    end
  end
end
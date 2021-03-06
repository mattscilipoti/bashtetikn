# frozen_string_literal: true

require "w3c_validators"

module Bashtetikn
  # Uses validator provided by W3C to validate HTML
  class HtmlValidatorFromW3C
    # Validates html text
    def validate_text(text_to_validate)
      underlying_validator.validate_text(text_to_validate)
    end

    def validate_uri(uri)
      underlying_validator.validate_uri(uri)
    end

    # The validator used to process the page
    def underlying_validator
      W3CValidators::NuValidator.new
    end
  end
end

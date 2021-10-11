require "w3c_validators"

class Bashtetikn::PageValidatorFromW3C
  def validate_text(text_to_validate)
    validator.validate_text(text_to_validate)
  end

  def validator
    W3CValidators::NuValidator.new
  end
end

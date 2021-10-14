require "vcr"

VCR.config do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.configure_rspec_metadata! # https://relishapp.com/vcr/vcr/v/6-0-0/docs/test-frameworks/usage-with-rspec-metadata
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock # or :fakeweb
end

RSpec.configure do |c|
  # so we can use :vcr rather than :vcr => true;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

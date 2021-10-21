# frozen_string_literal: true

require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.configure_rspec_metadata! # https://relishapp.com/vcr/vcr/v/6-0-0/docs/test-frameworks/usage-with-rspec-metadata
  c.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock # or :fakeweb
end

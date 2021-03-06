# frozen_string_literal: true

require_relative "lib/bashtetikn/version"

Gem::Specification.new do |spec|
  spec.name          = "bashtetikn"
  spec.version       = Bashtetikn::VERSION
  spec.authors       = ["Matt Scilipoti"]
  spec.email         = ["matt@scilipoti.name"]

  spec.summary       = "Tools to help validate web pages."
  spec.description   = <<-DESC
    Tools to help validate web pages.
    Gathers validation results from multiple sources, providing a single interface for both requests and responses.
  DESC
  spec.homepage      = "https://github.com/mattscilipoti/bashtetikn"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mattscilipoti/bashtetikn"
  spec.metadata["changelog_uri"] = "https://github.com/mattscilipoti/bashtetikn/blob/deploy/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "w3c_validators", "~> 1.3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

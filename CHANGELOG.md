- # Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a CHANGELOG](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Upcoming] - Generic validator, Multi-ruby testing

- Add Bashtetikn::HtmlValidator << Bashtetikn::HtmlValidatorFromW3C
- GitHub Actions test ruby 2.5, 2.6, 2.7, 3.0
- rubocop: requires rubocop-rake & rubocop-rspec


## [0.1.0] - 2021-10-20 Validate HTML (URI or Text)

- Initial release
- Bashtetikn::HtmlValidatorFromW3C#validate_text
- Bashtetikn::HtmlValidatorFromW3C#validate_uri
- Both return collection of warnings and errors
- WARNING: API is subject to frequent change

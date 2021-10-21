# Bashtetikn

Tools to help validate web pages. Gathers validation results from multiple sources, providing a single interface for both requests and responses.

> bashtetikn (Yiddish, _verb_, /bɛ-oSH-tɛk-in/): To validate, certify, or confirm

![status](https://github.com/mattscilipoti/bashtetikn/actions/workflows/main.yml/badge.svg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bashtetikn'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bashtetikn

## Usage

```ruby
require 'bashtetikn'
validator = Bashtetikn::HtmlValidatorFromW3C.new
suspect_url = "https://w3c-validators.github.io/w3c_validators/invalid_html5.html"

results = validator.validate_uri(suspect_url)
```

`puts results.errors`
```
ERROR; URI: https://w3c-validators.github.io/w3c_validators/invalid_html5.html; line 15: End tag for  “body” seen, but there were unclosed elements.
ERROR; URI: https://w3c-validators.github.io/w3c_validators/invalid_html5.html; line 10: Unclosed element “section”.
```

`puts results.warnings`
```shell
=> nil
```

## Supported Validators

| Content | Page | Fragment |
| ------- | ---- | -------- |
| [HTML (W3C)](https://validator.w3.org/unicorn/) | :white_check_mark: | :white_check_mark: |
| Accessibility (WAVE) | :soon: | :soon: |


## Development

We are dockerized! If using VS Code, this should automatically load inside a Dev Environment (see: https://code.visualstudio.com/docs/remote/containers).

- Run `rake spec` to run the tests.
- You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### If you don't want to use Docker...

After checking out the repo, run `bin/setup` to install dependencies.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mattscilipoti/bashtetikn. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mattscilipoti/bashtetikn/blob/deploy/CODE_OF_CONDUCT.md).

### Release Managers

- To install this gem onto your local machine, run `bundle exec rake install`.
- To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bashtetikn project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mattscilipoti/bashtetikn/blob/deploy/CODE_OF_CONDUCT.md).

<hr/>

[![I love Validator](https://validator.w3.org/unicorn/images/I_heart_validator.png)](https://www.w3.org/support/)

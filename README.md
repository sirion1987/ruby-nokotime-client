# Nokotime

Ruby client for [Noko](http://nokotime.com/) API.

[![Build Status](https://travis-ci.com/sirion1987/nokotime-ruby-client.svg?branch=master)](https://travis-ci.com/sirion1987/nokotime-ruby-client)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f38ea8d9b42e6b2bc566/test_coverage)](https://codeclimate.com/github/sirion1987/nokotime-ruby-client/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/f38ea8d9b42e6b2bc566/maintainability)](https://codeclimate.com/github/sirion1987/nokotime-ruby-client/maintainability)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nokotime-ruby-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nokotime-ruby-client

## Usage

1. Configure `.env` file. You must define the `NOKOTIME_TOKEN` environment
variable with your Nokotime API token.

E.g.

```
NOKOTIME_TOKEN=123921387213987132987
```

2. Configure client with:

```ruby
Nokotime.configure do |c|
  c.token = ENV["NOKOTIME_TOKEN"]
  c.auth_type = :noko_token
  c.max_concurrency = 5
end
```

You can set:

1. `auth_type`: the authentication type which will use with the server.
   Currently, the only allowed values is:
   * `:noko_token`: uses your Nokotime API token.
2. `max_concurrency`: max thread for each requests.

You can initialize each client with some query parameters (only for #all method):

* __Entry__: user_ids, description, project_ids, tag_ids, tag_filter_type, invoice_ids
  import_ids, from, to, invoiced, invoiced_at_from, invoiced_at_to
  updated_from, updated_to, billable, approved_at_from, approved_at_to
  approved_by_ids, per_page;
* __Project__: name, project_group_ids, billing_increment, enabled, billable, per_page;
* __ProjectGroup__: name, project_ids, per_page;
* __Tag__: name, billable, per_page;
* __User__: name, email, role, state, per_page;

## Example

```ruby
users = Nokotime::Client::Users.new({name: "my_name"}).all
users.last_responses.each do |resp|
  resp.body
end
```

# Testing

The test suite uses the [VCR](https://github.com/vcr/vcr) gem.

The contents of the cassettes is anonymized (see spec/spec_helper.rb).

## Regenerating the VCR cassettes

Occasionally, it is a good idea to regenerate the cassettes in order to
do an end-to-end test.

Make sure you have correctly set the `.env.test` file. Inside this file
you must specify the keys:

* `NOKOTIME_TOKEN`: your Nokotime API token;
* `REAL_NOKOTIME_ENTRY_ID`: a real entry id.
* `REAL_NOKOTIME_PROJECT_ID`: a real project id.
* `REAL_NOKOTIME_USER_ID`: a real user id.

```shell
$ rm -rf spec/fixtures/vcr_cassettes/*
$ bundle
$ bundle exec rspec
```

# Supported Ruby Versions

This library is tested against the following Ruby implementations:

* Ruby 2.4
* Ruby 2.5

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sirion1987/nokotime-ruby-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nokotime::Ruby::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nokotime-ruby-client/blob/master/CODE_OF_CONDUCT.md).

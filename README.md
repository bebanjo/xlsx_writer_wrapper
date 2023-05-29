# XlsxWriterWrapper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/xlsx_writer_wrapper`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem
## 👩🏾‍💻 Setup - Docker

1. Ensure you have desktop `docker` installed or install it with `brew install --cask docker`
2. Create a Github TOKEN in https://github.com/settings/tokens with all "repo" permissions, then add an export for it in your profile specs: `~/.bashrc` or `~/.zshrc` or  🤷🏾‍♀️
    ```bash
    export GITHUB_TOKEN=123adf123...
    ```
3. Build image: `docker compose build`
4. Then you can bring up all the services with `docker compose up -d`, this command starts the container APP or `make up`
6. Launch all specs: `docker compose exec app bundle exec rspec`
7. Launch console: `docker compose exec app sh`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xlsx_writer_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xlsx_writer_wrapper

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xlsx_writer_wrapper.


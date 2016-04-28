# Kave

Kave negar offering advance sms servis for developer , you can send & recive sms in often services and app !
notice: this service only work in iran country
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kave'
```

And then execute:
    $ bundle install

Or install it yourself(localy) as:
```ruby
    $ gem install kave
```
And create init file on config directory(kave.rb):

```ruby
Kave.configure do |config|
  config.wsdl ='http://api.kavenegar.com/soap/v1.asmx?WSDL'
  config.sender  = 'number'
  config.api_key = 'api key'
end
```
[kavenegar.com](http://kavenegar.com/)
## Usage



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mm580486/kave. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


# Kave

Kave negar offering advance sms servis for developer , you can send & receive sms in often services and app !
notice: this service only work in iran country
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kave'
```

And then execute:
```
$ bundle install
```
Or install it yourself(localy) as:
```ruby
$ gem install kave
```
And create init file on config directory(kave.rb):

```ruby
Kave.configure do |config|
  config.wsdl ='http://api.kavenegar.com/soap/v1.asmx?WSDL'
  config.sender  = 'number'

# You can user api key or username and password for authinticate 
  config.api_key = 'api key'
# OR
  config.username = 'kave username'
  config.password = 'kave password'
end
```
[kavenegar.com](http://kavenegar.com/) for receiver api key !
## Usage
alright ;) , now you can call kave function for send simply sms by loginfo or api key

```ruby
class HomeController < ApplicationController
  def index

  	request=Kave::SendRequestSimple.new({
   
    message: 'سلام عزیز :)',
    mobile: '09127105568',
    #optional
    unixdate: by default 0 ,
    msgmode: by default 1
})

  	res=request.call
  	render :text=>{status_message_only_farsi: res.statusmessage,status_code: res.status}
  end
end


```

for report issues contact me on twitter [@mm580486](https://twitter.com/mm580486)

## persian tutorials 

1-[youtube send simply sms by kave gem](https://twitter.com/mm580486)

2-[callback status code](http://kavenegar.com/public/documents/soap-document.pdf)
## License

The gem is available as open source under the terms of the [mohammad mahmoudi](https://twitter.com/mm580486) and [kave negar](http://kavenegar.com/support/about) .


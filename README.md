# idme

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'idme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idme

## Usage

api = IdMe::API.new('client_id','client_secret')
result = api.verify({first_name:'Colin, last_name:'Petruno'...})

if any new methods get added it should simply be

result = avi.newMethod({options_hash})

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

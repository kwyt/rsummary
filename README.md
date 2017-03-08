# Rsummary
Rsummary is saving tests output as histoties. And it provides simple commands to out for console.
You can use it easily whenever your timing. if you use it in your project would be a little smoother development.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rsummary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rsummary


## Usage

either launch your tests with

```
rspec $TESTS --format Rsummary::Save
```

or add

```
--format Rsummary::Save
```

in your .rspec file

### commands

* `history` - Showing tests output in past
* `status` - Showing test output at current
* `remove` - deleting histories 


## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/kwyt/rsummary. 


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

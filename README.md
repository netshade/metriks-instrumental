# metriks-instrumental

A gem to report your [Metriks][metriks] data to [Instrumental][instrumental].  

## Usage

Send metrics to [Instrumental][instrumental] every 60 seconds.

``` ruby
  # Using an API key
  reporter = Metriks::Reporter::Instrumental.new(:api_key => "Your Instrumental API key")

  # Using an already instantiated agent
  reporter = Metriks::Reporter::Instrumental.new(:agent => existing_instrumental_agent)

  reporter.start
```

## Installation

Add this line to your application's Gemfile:

    gem 'metriks-instrumental'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install metriks-instrumental

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[metriks]: http://github.com/eric/metriks
[instrumental]: https://instrumentalapp.com/

[![Gem Version](https://badge.fury.io/rb/metabridge.svg)](http://badge.fury.io/rb/metabridge)
[![Build Status](https://travis-ci.org/Telmate/metabridge.svg)](https://travis-ci.org/Telmate/metabridge)
[![Code Climate](https://codeclimate.com/github/Telmate/metabridge/badges/gpa.svg)](https://codeclimate.com/github/Telmate/metabridge)
[![Test Coverage](https://codeclimate.com/github/Telmate/metabridge/badges/coverage.svg)](https://codeclimate.com/github/Telmate/metabridge/coverage)
[![Dependency Status](https://gemnasium.com/Telmate/metabridge.svg)](https://gemnasium.com/Telmate/metabridge)

# metabridge

metabridge is a tool that enables easy access to the Android Debug Brige.

## Installation

metabridge can be installed as a command-line tool or as a Ruby gem that can be
used in other Ruby programs.

To install it for command-line use only, use the `gem` command:

    $ gem install metabridge

You can also add it to your application's Gemfile:

```ruby
gem 'metabridge'
```

And then execute:

    $ bundle


## Usage

As a command-line tool, metabridge uses the `metabridge` command. Simply run the
following command to get a list of all the available subcommands and some
examples:

```shell
$ metabridge
```

In order to get the list of remote devices connected to the network, use the following command:

```shell
$ metabridge list
Device found: 10.10.1.61      d8:50:e6:77:d0:c7 
Device found: 10.10.1.65      d8:50:e6:7f:2d:5a 
Device found: 10.10.1.79      ac:22:0b:45:99:49 
Device found: 10.10.1.57      d8:50:e6:72:db:f6 
```

If you want to get the `logcat` output from one device, use the MAC address 
(specified in the second column):

```shell
$ metabridge log -d d8:50:e6:77:d0:c7
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/Telmate/metabridge/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

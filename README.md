# Spark [![Gem Version](https://badge.fury.io/rb/spark_cli.svg)](https://badge.fury.io/rb/spark_cli) [![Build Status](https://travis-ci.org/PiXeL16/Spark.svg?branch=master)](https://travis-ci.org/PiXeL16/Spark) [![codecov](https://codecov.io/gh/PiXeL16/Spark/branch/master/graph/badge.svg)](https://codecov.io/gh/PiXeL16/Spark)

Spark is an easy to use CLI logger module that logs in color. :tada

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spark_cli'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install spark_cli

## Usage

Usage is very simple.
```ruby
require 'Spark'
spark = Spark::Fire.new
spark.info('This is an info message')
```
There are several log types to use
```ruby
@@spark.info('This is an Info message')
@@spark.error('This is an Error message')
@@spark.important('This is an important message')
@@spark.message('This is a regular message')
@@spark.warning('This is a warning message')
@@spark.success('Yayyy it worked')
```
That code will result in

![Spark screenshot](/web/spark_shot.png)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome at https://github.com/PiXel16/Spark.

## Author
Chris Jimenez - http://code.chrisjimenez.net, [@chrisjimeneznat](http://twitter.com/chrisjimeneznat)



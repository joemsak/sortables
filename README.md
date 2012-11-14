# Sortables

  Easily add sorting by an integer field on your ActiveRecord models

## Installation

Add this line to your application's Gemfile:

    gem 'sortables'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sortables

## Usage

    # you need an integer field on your model called position
    rails g migration AddPositionToMyModels position:integer

    class MyModel < ActiveRecord::Base
      sortable
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Unit

A gem for handling Unit objects with the KitCheck ecosystem.

## Goals

 * Needs to handle Mass, Volume, and Concentrations
 * Unit objects need the ability to be added to each other
 * Unit objects need the ability to be subtracted from one another
 * Actions taken on Unit object should dynamically scale and return a new unit with the unit of measure being the lowest common denominator of the two
 * Given a concentration, a user should have the ability to get the mass held in the solution
 * Unit objects should maintain a reference to the objects that created them
  

## Installation

Add this line to your application's Gemfile:

    gem 'unit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unit

## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

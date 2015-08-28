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

### Parsing

Standard use of the gem will involve parsing a string that represents the measurement of the unit. This can be called by:

    $ Unit.parse(<string>)

### Unit Classes

The Unit gem implements two base classes, Mass and Volume. These classes are subclasses of a base Unit class. A Unit is created by:

    $ Unit::{Mass|Volume}.new(scalar, uom, components)

`Scalar` represents the scalar value of the measurement. This will be converted into a BigDecimal. <br/>
`Uom` is a string representing the unit of measure. <br/>
`Components` is an optional parameter that allows you pass an array of objects to track the objects that created this unit of measure.

Unit classes implement the basic arithmatic operations (addition, subtraction, division) along with several other help functions.

`Unit#scale(scalar)` will multiple the scalar value of the Unit object by the amount passed to the method. <br/>
`Unit#convert_to(uom)` will attempt to convert the Unit to the uom passed to the method. Will raise a IncompatibleUnitsError if it fails.<br/>

Unit classes also provide some formatting methods that will return hashes for clean serialization.
`Unit#to_hash` will output a hash with the following format:
> { <br/>
> &nbsp;&nbsp; :scalar => raw_scalar, <br/>
> &nbsp;&nbsp; :uom => raw_uom, <br/>
> &nbsp;&nbsp; :components => components <br/>
> }

`Unit#to_formatted_hash` will output the contents of `Unit#to_hash` along with:
> { <br/>
> &nbsp;&nbsp; :scalar_formatted => raw_scalar_rounded_to_2_decimal_places, <br/>
> &nbsp;&nbsp; :uom_formatted => lower_cased_uom <br/>
> }



### Concentration

A Concentration class is derived from dividing a Mass by a Volume. The class maintains the numerator and denominator as distinct <br/>
elements until display to not lose precision.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# SettingMacro

Defines a `setting` class method which can be used to retrieve and set some
class-level veriables. Heavily inspired by the [ClassMacros in the rom-support
respository](https://github.com/rom-rb/rom-support/blob/31085bb9a02a68455f2a66dce1fa08fcfd937430/lib/rom/support/class_macros.rb).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'setting_macro'
```

## Usage

```ruby
class Heating
  extend SettingMacro
  setting :default_temperature
  setting :heat_source, default: 'unknown'
end

class Oven < Heating
  default_temperature 200
end

class Sun < Heating
  default_temperature 5505
  heat_source 'nuclear_fusion'
end

p Heating.default_temperature # => nil
p Heating.heat_source # => 'unknown'

p Oven.default_temperature # => 200
p Oven.heat_source # => 'unknown'

p Sun.default_temperature # => 5505
p Sun.heat_source # => 'nuclear_fusion'
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mcls/setting_macro. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


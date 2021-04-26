# ValidatesCPF

[![Gem Version](https://badge.fury.io/rb/validates_cpf.png)](http://badge.fury.io/rb/validates_cpf) [![Build Status](https://secure.travis-ci.org/plribeiro3000/validates_cpf.png?branch=master)](http://travis-ci.org/plribeiro3000/validates_cpf) [![Dependency Status](https://gemnasium.com/plribeiro3000/validates_cpf.png)](https://gemnasium.com/plribeiro3000/validates_cpf) [![Coverage Status](https://coveralls.io/repos/plribeiro3000/validates_cpf/badge.png?branch=master)](https://coveralls.io/r/plribeiro3000/validates_cpf)  [![Code Climate](https://codeclimate.com/github/plribeiro3000/validates_cpf.png)](https://codeclimate.com/github/plribeiro3000/validates_cpf)

Validates cpf and test it in a simple way.
Supports ruby 2.2+ and rails 3+. For older ruby versions use the version `2`.

## Installation

Add this line to your application's Gemfile:

    gem 'validates_cpf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_cpf

## Usage

Just use as any other validator:

```ruby
class User < ActiveRecord::Base
  validates :cpf, cpf: true
end
```

To force the attribute to be masked pass option `mask`:

```ruby
class User < ActiveRecord::Base
  validates :cpf, cpf: { mask: true }
end
```

## Testing

Require the matcher:

```ruby
require 'validates_cpf/require_a_valid_cpf_matcher'
```

Use in your tests:

```ruby
it { is_expected.to require_a_valid_cpf } # It will test the attribute :cpf by default
it { is_expected.to require_a_valid_cpf(:id) }
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

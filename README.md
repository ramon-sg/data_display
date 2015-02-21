# DataDisplay

A better way to show attributes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'data_display'
```

And then execute:

    $ bundle

Run the generator:

    $ rails generate data_display:install

## Usage

At first, you need to add `acts_as_displayable` in your models:

```ruby
# For all attributes
class Product < ActiveRecord::Base
  acts_as_displayable
end
```
Or:

```ruby
# For some attributes
class Product < ActiveRecord::Base
  acts_as_displayable :name, :description, :price, :active, :published_at
end
```

This generates the display methods to model attributes (eg [attribute] _display)

```ruby
product = Product.new published_at: DateTime.now,
                      active: true,
                      title: nil,
                      price: 999990,
                      description: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus"

# Date, DateTime or Time
product.published_at_display
=> "December 10, 2012 11:58"

product.published_at_display :short
=> "10 Dec 11:58"

# YesClass or FalseClass
product.active_display
=> "Yes"

# String
product.content_display
=> "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ..."

product.content_display(:short)
=> "Lorem ipsum dolor sit amet, consectetuer adipiscing elit...."

# NilClass
product.title_display
=> "(empty)"

product.title_display(:short)
=> "-"

# Fixnum or Float
product.price_display
=> "9,999,990"

product.price_display(:currency)
=> "$9,999,990.00"

```

If you need to edit the format for dates or text, you can see the config/locales/data_display.en.yml (generated with `rails g data_display:install`)

```yaml
en:
  data_display:
    true_class:
      formats:
        long: 'Yes'
        short: 'Yes'
    false_class:
      formats:
        long: 'No'
        short: 'No'
    nil_class:
      formats:
        long: '(empty)'
        short: '-'
    time:
      formats:
        long: ! '%B %d, %Y %H:%M'
        short: ! '%d %b %H:%M'
    date_time:
      formats:
        long: ! '%B %d, %Y %H:%M'
        short: ! '%d %b %H:%M'
    date:
      formats:
        long: ! '%B %d, %Y'
        short: ! '%b %d'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/data_display/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

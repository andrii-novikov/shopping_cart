# ShoppingCart
Short description and motivation.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install shopping_cart
```

Copy and install migrations:
```ruby
    rake shopping_cart:install:migrations 
```
```bash
    rails db:migrate
```

Instal gem:
```bash
    rails g shopping_cart:install   
```

If you want customize view:
```bash
    rg shopping_cart:views  
```

You also can fill countries, deliveries, coupon with default values
```bash
    shopping_cart:fill:countries
    shopping_cart:fill:deliveries
    shopping_cart:fill:coupons
```
Additional configuration you can find at _config/initializers/shopping_cart.rb_

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

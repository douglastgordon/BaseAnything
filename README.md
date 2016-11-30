#BaseAnything

BaseAnything is a Ruby Gem that allows you to create a number system of any base using any symbols you want. It also allows you to freely convert to any other base.

##Installation

Add this line to your application's Gemfile:

```ruby
gem 'baseanything'
```

And then execute:
```ruby
    $ bundle
```
Or install it yourself as:
```ruby
    $ gem install baseanything
```
##Usage

###Making your own number system

To make a number system of your choosing, first make an array of characters representing the symbols you would like to use in your number system. The index of each symbol will represent the symbol's decimal value.

Say you want to make a base5 system using characters as the symbols. You can create an array like:

```ruby
symbols = ['@', '#', '$', '%', '&']
```
And create the number system like so:

```ruby
BaseAnything::NumberSystem.new(symbols)
```

And each symbol will have the following decimal values:

```ruby
decimal_correspondence = {
  '@' => 0,
  '#' => 1,
  '$' => 2,
  '%' => 3,
  '&' => 4
}
```
So:

'#@' has the decimal value of 5.
'%$#' has the decimal value of 86.
'&&&#' has the decimal value of 621.

###Converting to other bases

You can take a number written in your base system and convert it to any base up to 35 with the to_base(num, base) method.

```ruby
my_base_4 = BaseAnything::NumberSystem.new(['@', '#', '$', '%', '&'])
my_num = '%#'
target_base = 4

my_base_4.to_base(my_num, target_base)
#returns '31'
```

Alternatively, you can use any of the following semantic methods:

```ruby
my_base_4.to_binary(num) #converts num to base2
my_base_4.to_ternary(num) #converts num to base3
my_base_4.to_quaternary(num) #converts num to base4
my_base_4.to_quinary(num) #converts num to base5
my_base_4.to_senary(num) #converts num to base6
my_base_4.to_heptary(num) #converts num to base7
my_base_4.to_octal(num) #converts num to base8
my_base_4.to_nonary(num) #converts num to base9
my_base_4.to_decimal(num) #converts num to base10
my_base_4.to_undecimal(num) #converts num to base11
my_base_4.to_duodecimal(num) #converts num to base12
my_base_4.to_tridecimal(num) #converts num to base13
my_base_4.to_tetradecimal(num) #converts num to base14
my_base_4.to_pentadecimal(num) #converts num to base15
my_base_4.to_hexadecimal(num) #converts num to base16
my_base_4.to_vigesimal(num) #converts num to base20
my_base_4.to_hexavigesimal(num) #converts num to base24
my_base_4.to_heptavigesimal(num) #converts num to base27
my_base_4.to_trigesimal(num) #converts num to base30
my_base_4.to_duotrigesimal(num) #converts num to base32
my_base_4.to_hexatrigesimal(num) #converts num to base36
```

###Converting from other bases

You can take a number written in any base system and convert it to your base system using the from_base(num, base) method.

```ruby
my_base_4 = BaseAnything::NumberSystem.new(['@', '#', '$', '%', '&'])
my_num = '100011'
base_of_my_num = 2

my_base_4.from_base(my_num, target_base)
#returns '$@%'
```

Alternatively, you can use any of the following semantic methods:

```ruby
my_base_4.from_binary(num) #converts num from base2
my_base_4.from_ternary(num) #converts num from base3
my_base_4.from_quaternary(num) #converts num from base4
my_base_4.from_quinary(num) #converts num from base5
my_base_4.from_senary(num) #converts num from base6
my_base_4.from_heptary(num) #converts num from base7
my_base_4.from_octal(num) #converts num from base8
my_base_4.from_nonary(num) #converts num from base9
my_base_4.from_decimal(num) #converts num from base10
my_base_4.from_undecimal(num) #converts num from base11
my_base_4.from_duodecimal(num) #converts num from base12
my_base_4.from_tridecimal(num) #converts num from base13
my_base_4.from_tetradecimal(num) #converts num from base14
my_base_4.from_pentadecimal(num) #converts num from base15
my_base_4.from_hexadecimal(num) #converts num from base16
my_base_4.from_vigesimal(num) #converts num from base20
my_base_4.from_hexavigesimal(num) #converts num from base24
my_base_4.from_heptavigesimal(num) #converts num from base27
my_base_4.from_trigesimal(num) #converts num from base30
my_base_4.from_duotrigesimal(num) #converts num from base32
my_base_4.from_hexatrigesimal(num) #converts num from base36
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DouglasTGordon/BaseAnything.

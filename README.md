#BaseAnything

BaseAnything is a gem that allows you to create a number system of any base.

##Usage

###Making your own number system

To make a number system of your choosing, first make an array of characters representing the symbols you would like to use in your number system. The index of each symbol will represent the symbol's decimal value.

Say you want to make a base5 system using characters as the symbols. You can create an array like:

```ruby
symbols = ['@', '#', '$', '%', '&']
```
And create the number system like so:

```ruby
NumberSystem.new(symbols)
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

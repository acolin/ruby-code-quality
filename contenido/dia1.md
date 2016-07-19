# Clean Code

Ruby code quality, principles, practices & techniques

![Uncle Bob](https://d26o5k45lnmm4v.cloudfront.net/authors-robert-martin-v0.jpg)

### Temas

* [Naming](#naming)
* [Functions](#functions)
* [Exceptions](#exceptions)
* [Classes](#classes)
* [SOLID Principles](#solid-principles)

--

### Naming

Give meaningful names that are:
* Intention revealing
* Pronounceable
* Distinctable
* Class names should be nouns/noun-verbs
* Method names should be phrases/verb-phrases
* One word per concept

```ruby
## Intention revealing & Pronounceable

# Bad
edt
sdt
fname
stotal
pup
pts

# Good
end_datetime
start_datetime
first_name
subtotal
page_up
points

## Distinctable, One Word Per Concept
# Bad
info
description
name
fullname
place
location
run
execute

# Good
bio
description
first_name
fullname
place
waypoints
run

## Class Names
# Should be nouns
User
Form
Friend
Invitation
Location
Order
Invoice

# Should be noun-phrases
Signup
DiscountCalculator
TripFinder
ShippingCalculator
AccountCreator

## Method Names
# Should be verbs
invite
authorize
create
delete

# Should be verb-phrases
find_location
send_reminder
has_friendship_with?
signup
```
### Functions

* Should be small, do 1 thing at 1 level of abstraction
* Avoid the use of switch statements
* Have at most 3 arguments
* Do something or Answer something
* Have no side effects

```ruby
## Should be small
# Bad

def total
  subtotal = items.sum(:price)
  discount = items.sum(:discount)

  subtotal - discount
end

# Good
def total
  subtotal - discount
end

def subtotal
  items.sum(:price)
end

def discount
  items.sum(:discount)
end

## Avoid the use of switch statements

# Bad
class Payment
  attr_reader payment_method

  def process
    case payment_method.class
    when "CreditCart"
    when "Deposit"
    when "Cash"
  end
end

# Good
class Payment
  attr_reader payment_method

  # A switch statement hides an opportunity to use polymorphism or duck typing
  def process
    payment_method.purchase(self)
  end
end

## Have at most 3 arguments
# Zero arguments is the winner
# Prefer instance variables, but remember the cohesion principle:
# all methods in a class should use most of the instance variables in that class

class Signup
  attr_accessor :email, :password, :password_confirmation
  
  def initialize(args={})
    @email = args[:email]
    @password = args[:password]
    @password_confirmation = args[:password_confirmation]
  end
  
  def call
    begin
      create_user
      send_notification
    rescue => e
      # Rescue code goes here
    end
  end
end

# One argument should ask or transform not both
class User
  # This is asking something
  def has_friendship_with?(another_user)
    Friendship.exists?(self, another_user)
  end

  # This is transforming something
  def change_password(new_password)
    self.password = new_password
  end
end

# Two arguments suck!
# Avoid or convert to one argument using instance variables
# Give your functions better names

# Hard to remember gotta google it bitch!
asserts_equal(expected, actual)

# Easy to remember no need for the api
asserts_expected_to_eq_actual(expected, actual)


# Three arguments, AVOID AT ALL COSTS!!!
# use argument objects
# use argument lists

# send options hash for a list html options
def text_field_tag(name, value, html_options={}); end

# convert x, y coordinates into a center object
def make_circle(center, radius); end
```
### Exceptions

```ruby
```

### Classes

```ruby
```

### SOLID Principles
```ruby
```

#### Referencias

- [Clean Code - by Uncle Bob](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)

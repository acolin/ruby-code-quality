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

## Distinctable, Never Duplicate
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

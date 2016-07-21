# SOLID Principles

Basic principles for better interfaces

![Sandi Metz](http://www.abetterdeveloper.com/assets/sandi_metz-42a6d38e5d4b591e219099dfd6e48ff6.png)

### Temas

* [Single Responsibility](#single-responsibility)
* [Sharing Role Behavior with Modules](#sharing-role-behavior-with-modules)
* [Duck Typing](#duck-typing)
* [Managing Dependencies](#managing-dependencies)
* [Inheritance](#inheritance)

--

### Single Responsibility

* Every context (class, function, variable...) should have a single responsibility.
* All its services should be narrowly aligned with that responsibility.

```ruby
## How to detect it
# Ask the public methods
class SignUp
  def save; end
  def export_to_pdf; end
  def recover_password; end
  
  private
  # Your codez
end

# Describe it in one sentence
# Current: It Recovers/changes password and creates an account (not ok!)
# Single: It recovers a user's password (ok!)
# Tip: Multiple responsibilities are separated by 'ands', 'ors'
class RecoverPassword
  def recover; end
  def create_account; end
  def change_password; end
end

## How to correct it
# Find the missing classes
class RecoverPassword
  def recover; end
end

class CreateAccount; end
class ChangePassword; end

# Extract extra responsibilities from methods
# NOT OK
def total
  subtotal = items.sum(:price)
  discount = items.sum(:discount)
  
  subtotal - discount
end

# OK
def total
  subtotal - discount
end

def subtotal
  items.sum(:price)
end

def discount
  items.sum(:discount)
end
```

### Sharing Role Behavior with Modules

* Used to share behavior among unrelated objects
* Is a 'behaves like a' schedulable, authenticable, checkinable, searchable

```ruby
## Role example
# A module giving the behavior of schedulable to any object
module Schedulable
    attr_writer :schedule

    def schedule
        @schedule ||= ::Schedule.new
    end

    def schedulable?(start_date, end_date)
        !scheduled?(start_date - lead_days, end_date)
    end

    def scheduled?(start_date, end_date)
        schedule.scheduled?(self, start_date, end_date)
    end

    # includers may override
    def lead_days
        0
    end
end

# Using it
class ClassRoom
  include Schedulable

  def lead_days
    1   
  end
end

class FootballCourt
  include Schedulable
  
  def lead days
    7
  end
end
```

### Duck Typing

* If it swims like a duck, quacks like a duck, then is probably a duck.
* An interface shared among several classes
* A class can respond to multiple interfaces

```ruby
## Container class
class Report
  def export_to(format = Report::PDF)
    format.new.export(self)
  end
end

# These are the ducks
# Both implement the same interface
class Report::PDF
  def export; end
end

class Report::HTML
  def export; end
end
```

### Managing Dependencies

* If an object changes and if forces other objects to change too

```ruby
# Find the dependencies
class Report
  def export
    Report::PDF.export(self)
  end
end

class Report::PDF
  def self.export(self); end
end

# Solution 1: Dependency injection
class Report
  # Injecting the class, removing explicit class dependency
  def export(format = Report::PDF)
    format.export(self)
  end
end

class Report::PDF
  def self.export(self); end
end

# Solution 2: Isolate instance creation
# Problem
class Order
  def initialize(args = {}); end

  def total
    Order::Calculator.new.calculate(self)
  end
end

# Solution
class Order
  # Include the instance creation in the initializer
  # creates the instance even if we don't need it yet
  def initialize(args = {})
    @calculator = Order::Calculator.new
  end

  def total
    calculator.calculate(self)
  end

  # A Second alternative
  # Wrap in a method, lazy loading style
  def calculator
    @calculator ||= Order::Calculator.new
  end
end

# Solution 3: Remove argument order dependencies
# Problem
class Order
  def initialize(customer, line_items, address); end

  def total
    Order::Calculator.new.calculate(self)
  end
end

# Solution
class Order
  # Removes argument order dependency
  def initialize(args = {}); end

  def total
    Order::Calculator.new.calculate(self)
  end
end
```

### Inheritance

* If it swims like a duck, quacks like a duck, then is probably a duck.
* An interface shared among several classes
* A class can respond to multiple interfaces

```ruby
## Container class
class Report
  def export_to(format = Report::PDF)
    format.new.export(self)
  end
end

# These are the ducks
# Both implement the same interface
class Report::PDF
  def export; end
end

class Report::HTML
  def export; end
end
```

#### Bibliography
- [Practical Object Oriented Design in Ruby](http://www.poodr.com/)

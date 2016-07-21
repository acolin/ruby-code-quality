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

* Automatic message delegation
* Use the template pattern
* decouple using hook messages

```ruby
# Template Pattern
class Paginator
  def initialize(args = {})
    @per_page = args.per_page || default_per_page
    @max_pages = args.per_page || default_max_pages
  end

  # Template method, must implement in subclass
  def paginate
    raise NotImplementedError, "The #{self.class} must implement:"
  end

  private

  # Creating default values for arguments
  # good practice to avoid malfunction
  def default_per_page
    25
  end

  def default_max_pages
    10
  end
end

class TinyPaginator < Paginator
  def paginate
    # Pagination code goez here...
  end

  private

  def default_per_page
    5
  end

  def default_max_pages
    5
  end
end

# Decoupling with hook messages
class Bike
  attr_reader :chain, :tire_size
  def initialize(args = {})
    @chain = args.chain || default_chain
    post_initialize(args)
  end

  def spares
    { tire_size: tire_size,
      chain: chain }.merge(local_spares)
  end

  # Post initialize hook, avoid using the super
  # giving specialization to the initialization
  def post_initialize(args)
    nil
  end

  # hook to initialize the spares
  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end
end
```

#### Bibliography
- [Practical Object Oriented Design in Ruby](http://www.poodr.com/)

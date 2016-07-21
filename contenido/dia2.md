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

#### Referencias
- [Practical Object Oriented Design in Ruby](http://www.poodr.com/)

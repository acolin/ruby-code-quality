# Intro a Javascript

Conociendo Javascript y sus técnicas básicas de programación

![Javascript](http://gregfranko.com/images/JavaScript-logo-small.png)

### Topics

* [Historia de Javascript](#law-of-demeter)
* [Variables](#activerecord)
* [Operadores](#presenters)
* [Condicionales](#single-responsibility-principle)
* [Ciclos](#null-object-pattern)
* [Funciones](#factory)

--

### Historia de Javascript

* Creado por Brendan Eich en 1995, en tan solo 10 días, en ese entonces trabajaba en Netscape ahora en Mozilla.
* Para 1997 Javascript fue llevado a ECMA para crear un estándar de tal forma que los otros browsers pudieran utilizarlo.
* A través de un paper de Jesse James Garrett nace Ajax, un conjunto de tecnologías que permite cargar información sin la necesidad de un 'full page reload', gracias a esto surgen librerias como Prototype, jQuery, Dojo & Mootools.
* En 2009 surge ECMAScript 5 conocido como Harmony, actual estándar en los browsers.
* Para 2009 nace Node.js, nos permite llevar Javascript a aplicaciones en backend.
* En 2014 con el nacimiento de HTML5 se habilita el control de multimedia, web sockets para comunicación en tiempo real entre otros.
* Para el 2015 nace ECMAScript 6, que adhiere muchos elementos de programación orientada a objetos y facilita la programación asíncrona.

### Estructura de un programa en Javascript

```javascript
```

#### Variables

En programación, las variables son espacios reservados en la memoria que, como su nombre indica, pueden cambiar de contenido a lo largo de la ejecución de un programa.

```javascript
// Declaración básica de una variable
var email;
var totalCost;

// Declaración y asignación
var email = 'rodriguezcolin@gmail.com';
var totalCost = 150.10;

/**
Tipos de Variables:
  null
  undefined
  boolean (true, false)
  number (1, 2.1, 2.20)
  string ('my name', "my name")
  object ( { name: 'juan', email: 'ramirez' } )
**/

var imUndefined;
var imNull = null;
console.log(imUndefined);
console.log(imNull);

var imTrue = true;
var imFalse = false;
console.log(imTrue);
console.log(imFalse);

var imANumber = 2;
var imANumberToo = 10.40;
console.log(imANumber);
console.log(imANumberToo);

var imAString = 'Im a string';
var imAStringToo = "Im a string";
console.log(imAString);
console.log(imAStringToo);

var imAnObject = {
  name: 'Juan',
  email: 'juan@gmail.com',
  age: 15,
  iKnowJS: false
};
console.log(imAnObject);
```

#### Operadores

```javascript
```

#### Condicionales

```ruby
class Author < ActiveRecord::Base
	has_many :articles
	has_one :personal_information
	
	delegate  :name,
	          :birthdate,
	          :gender,
	          :city,
	          :last_name,
	          to: :personal_information
end

class Article < ActiveRecord::Base
	belongs_to :author
	
	delegate  :name,
	          :birthdate,
	          :gender,
	          :city,
	          :last_name,
	          to: :author,
	          prefix: true

end
```

### Ciclos

In software engineering, the active record pattern is an architectural pattern found in software that stores in-memory object data in relational databases. It was named by Martin Fowler in his 2003 book Patterns of Enterprise Application Architecture.[1] The interface of an object conforming to this pattern would include functions such as Insert, Update, and Delete, plus properties that correspond more or less directly to the columns in the underlying database table.

The active record pattern is an approach to accessing data in a database. A database table or view is wrapped into a class. Thus, an object instance is tied to a single row in the table. After creation of an object, a new row is added to the table upon save. Any object loaded gets its information from the database. When an object is updated the corresponding row in the table is also updated. The wrapper class implements accessor methods or properties for each column in the table or view.

#### Example

```ruby
class User < ActiveRecord::Base
end
```

[Code](active_record)

### Funciones

In object-oriented programming, the decorator pattern (also known as Wrapper, an alternative naming shared with the Adapter pattern) is a design pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class.[1] The decorator pattern is often useful for adhering to the Single Responsibility Principle, as it allows functionality to be divided between classes with unique areas of concern.


#### Referencias

- [https://en.wikipedia.org/wiki/Decorator_pattern](https://en.wikipedia.org/wiki/Decorator_pattern)
- [https://github.com/drapergem/draper](https://github.com/drapergem/draper)
- [http://railscasts.com/episodes/286-draper](http://railscasts.com/episodes/286-draper)

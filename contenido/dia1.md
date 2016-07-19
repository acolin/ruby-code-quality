# Intro a Javascript

Clean Code

![Uncle Bob](https://d26o5k45lnmm4v.cloudfront.net/authors-robert-martin-v0.jpg)

### Temas

* [Historia de Javascript](#historia-de-javascript)
* [Variables](#variables)
* [Operadores](#operadores)
* [Condicionales](#condicionales)
* [Ciclos](#ciclos)
* [Funciones](#funciones)

--

### Historia de Javascript

* Creado por Brendan Eich en 1995, en tan solo 10 días, en ese entonces trabajaba en Netscape ahora en Mozilla.
* Para 1997 Javascript fue llevado a ECMA para crear un estándar de tal forma que los otros browsers pudieran utilizarlo.
* A través de un paper de Jesse James Garrett nace Ajax, un conjunto de tecnologías que permite cargar información sin la necesidad de un 'full page reload', gracias a esto surgen librerias como Prototype, jQuery, Dojo & Mootools.
* En 2009 surge ECMAScript 5 conocido como Harmony, actual estándar en los browsers.
* Para 2009 nace Node.js, nos permite llevar Javascript a aplicaciones en backend.
* En 2014 con el nacimiento de HTML5 se habilita el control de multimedia, web sockets para comunicación en tiempo real entre otros.
* Para el 2015 nace ECMAScript 6, que adhiere muchos elementos de programación orientada a objetos y facilita la programación asíncrona.


#### Inline, Internal, External - Formas de incluir Javascript en dentro del HTML

```html
<!-- INLINE: Se coloca dentro de las etiquetas y se activa cuando suceden ciertos eventos -->
<input type="button" id="hello" value="Hello" onClick = "alert('Hello World!')">

<!-- INTERNAL: Se coloca dentro de la etiqueta script -->
<script>
  alert('hello world');
</script>

<!-- EXTERNAL: Contenido en archivos externos y referenciado en el HTML -->
<!-- Dentro de un archivo llamado external.js -->
function sayHi() {
  alert('hello everybody');
}

<!-- En un archivo HTML -->
<!DOCTYPE html>
<html>
<head>
 <title>Page Title</title>
 <script language="javascript" src="path/to/externaljs.js"></script>
</head>
<body>

<script>
  sayHi();
</script>
</body>
</html>
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
  array [1, 'hello', false]
**/

// null & undefined
var imUndefined;
var imNull = null;

// booleans
var imTrue = true;
var imFalse = false;

// numbers
var imANumber = 2;
var imANumberToo = 10.40;

// strings
var imAString = 'Im a string';
var imAStringToo = "Im a string";

// objects
var imAnObject = {
  name: 'Juan',
  email: 'juan@gmail.com',
  age: 15,
  iKnowJS: false
};

// arrays
var myArr = [
  1,
  'hello',
  false
];
```

#### Operadores

##### Aritméticos

```javascript
/**
Tipos:
  + (suma)
  - (resta)
  / (división)
  * (multiplicación)
  % (residuo/mod)
**/

100 + 10 * 20;
10 / 20 - 5;
10 / 20 * 5;
20 % 2;

// Agrupar para definir precedencias
(100 + 10) * 20;
10 / (20 - 5);
```

#### Booleanos
```javascript
/**
Tipos:
  > (mayor que)
  < (menor que)
  >= (mayor igual)
  <= (menor igual)
  == (igual valor)
  === (igual valor y tipo)
  ! (negación)
  != (diferente valor)
  !== (diferente valor y tipo)
  && (and)
  || (or)
**/

10 > 5;
10.5 < 30;
50 >= '50';
!false && true;
'10' === 10;
10 <= 5 || !true && false;

```

#### Condicionales
Nos ayudan principalmente a condicionar el flujo de ejecución de nuestros programas.

```javascript
// if
if (10 > 5) {
   alert('yay');
}

// if else
if ('hola' === "alo") {
  alert('yay');
} else {
  alert('nay');
}

// if else elsif
if ('hola' == 'alo') {
  alert('alo');
} else if ('hola' == 'hola') {
  alert('hola');
} else {
  alert('last condition');
}

// switch
var name = 'juan';

switch name {
    case 'hugo':
    	alert('found hugo');
        break;
    case 'paco':
    	alert('found paco');
        break;
    default:
    	alert('not found!');
}
```

### Ciclos
Nos ayudan a realizar operaciones repetitivas sobre sets de datos.

```javascript
// While
var i = 0;
while (i < 10) {
    console.log("The number is " + i);
    i++;
}

// Do While
var i = 0;
do {
    console.log("The number is " + i);
    i++;
}
while (i < 10);

// For
for (i = 0; i < 5; i++) {
    console.log("The number is " + i);
}
```

### Funciones
Es la forma más básica de abstracción y reutilización de nuestro código.

```javascript
// Sin parametros, sin retorno
function sayHi() {
  alert('hi');
}

sayHi();

// Con parametros y retorno
function plusTen(number) {
  return number + 10;
}

plusTen(11);

// Modificando un parametro externo
var total;

function calculateTotal() {
  total = 1500;
}

calculateTotal();
```

#### Referencias

- [Eloquent Javascript](http://eloquentjavascript.net/)

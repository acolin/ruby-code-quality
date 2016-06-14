# jQuery: Manipulación del DOM

Manipulando el DOM para agregar dinamísmo a nuestras apps

![jQuery](https://brand.jquery.org/resources/jquery-mark-dark.gif)

### Temas

* [¿Qué es el DOM?](#que-es-el-dom)
* [jQuery](#jquery)
* [Selectores](#selectores)
* [Manipulando contenido](#manipulando-contendio)
* [Eventos](#eventos)
* [Ajax](#ajax)

--

### ¿Qué es el DOM?

El Modelo de Objetos del Documento (DOM) es una interfaz de programación de aplicaciones (API) para documentos HTML y XML. Define la estructura lógica de los documentos y el modo en que se accede y manipula un documento. En la especificación del DOM, el término "documento" se utiliza en un sentido amplio.

![DOM](http://www.w3schools.com/js/pic_htmltree.gif)

#### jQuery

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

#### Selectores

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

#### Manipulando contenido
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

### Eventos
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

### Ajax
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

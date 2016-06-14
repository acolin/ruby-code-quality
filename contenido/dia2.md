# jQuery: Manipulación del DOM

Manipulando el DOM para agregar dinamísmo a nuestras apps

![jQuery](https://brand.jquery.org/resources/jquery-mark-dark.gif)

### Temas

* [¿Qué es el DOM?](#¿qué-es-el-dom?)
* [jQuery](#jquery)
* [Selectores](#selectores)
* [Manipulando contenido](#manipulando-contendio)
* [Eventos](#eventos)
* [Ajax](#ajax)

--

### ¿Qué es el DOM?

Define la estructura lógica de los documentos y el modo en que se accede y manipulan.

![DOM](http://www.w3schools.com/js/pic_htmltree.gif)

#### ¿Qué se puede manipular?

* JavaScript puede cambiar todos los elementos HTML en la página
* JavaScript puede cambiar todos los atributos HTML en la página
* JavaScript puede cambiar todos los estilos CSS en la página
* JavaScript remover elementos y atributos de HTML existentes
* JavaScript puede agregar elementos y atributos HTML
* JavaScript puede reaccionar a todos los eventos HTML en la página
* JavaScript puede crear nuevos eventos HTML

#### Manipilación directa del DOM

```javascript
// Creando elementos
var element = document.createElement(tagName);

// Agregando stilos al elemento creado
element.style.color = "#ff3300";
element.style.marginTop = "30px";
element.style.paddingBottom = "30px";

// Obteniendo el contenido de un elemento
var content = element.innerHTML;
// Agregando el contenido a un elemento
otherElement.innterHTML = content;

// Obteniendo el nombre de la clase
var cName = element.className;
// Agregando el nombre de la clase
otherElement.className = cName;

// Obteniendo el valor del atributo id
var idStr = element.id;
// Agregando el valor del atributo id
otherElement.id = idStr;

// Obteniendo un elemento via su id
element = document.getElementById(id);
// Obteniendo los elementos que contenga una clase
elements = document.getElementsByClassName(names); // or:
elements = rootElement.getElementsByClassName(names);

// Obteniedo los elementos por el nombre de la etiqueta
var elements = document.getElementsByTagName(name);
```

### jQuery

jQuery es un framework de JavaScript para facilitar, entre otros, el acceso a los elementos del DOM, los efectos, interactuar con los documentos HTML, desarrollar animaciones y agregar interacción con la tecnología AJAX a páginas web.

```html
<!-- Preparándonos para usar jQuery -->
<!DOCTYPE html>
<html>
<head>
<title>My page</title>
<!-- cargando jQuery desde un CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>

<script>
  // Espera a que el elemento document esté listo
  $(document).ready(function(){
    // Tu código aquí
    console.log('el documento está listo');
  });
  
  // Una forma más corta que hace lo mismo
  $(function(){
    // Tu código aquí
    console.log('el documento está listo');
  });
</script>
</body>
</html>
```

#### Selectores
Proveen una interfaz sencilla para seleccionar cualquier elemento dentro del DOM

```html
<!DOCTYPE html>
<html>
<head>
<title>My page</title>
<!-- cargando jQuery desde un CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>
<p>Soy un elemento párrafo</p>

<div id='money'><span class='currency'>$</span>10.00</div>

<ul id='numbers-list' class='list'>
  <li>uno</li>
  <li>dos</li>
</ul>

<p>Otro párrafo</p>

<form>
  <div>Form is surrounded by the green border.</div>
 
  <label for="name">Child of form:</label>
  <input name="name" id="name">
 
  <fieldset>
    <label for="newsletter">Grandchild of form, child of fieldset:</label>
    <input name="newsletter" id="newsletter">
  </fieldset>
</form>
Sibling to form: <input name="none">

<script>
  $(function(){
    // BÁSICOS
    // seleccionar un elemento via su id
    var moneyDiv = $('#money');
    // seleccionar elementos via su clase
    var allLists = $('.list');
    // seleccionar por nombre de etiqueta
    var allULs = $('p');
    // con multiples selectores
    var currencySpan = $('div, span.currency');
    
    // CON ATRIBUTOS
    // seleccionar los elementos que tiene un atributo
    var withType = $('[type]');
    var withBrand = $('[data-brand]');
    
    // FORMAS
    var buttons = $(':button');
    var inputs = $(':input');
    var textInputs = $(':text');
    var selectedOptions = $(':selected');
    
    // JERARQUÍAS
    // selecciona los hijos inmediatos
    var children = $('form > label');
    // selecciona todos los descendientes
    var descendants = $('form input');
  });
</script>
</body>
</html>

```

#### Manipulando contenido
Proveen una forma sencilla de agregar, remover contenido a los elementos previamente seleccionados

```html
<!DOCTYPE html>
<html>
<head>
<title>My page</title>
<!-- cargando jQuery desde un CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>
<p>Soy un elemento párrafo</p>

<div id='money'><span class='currency'>$</span>10.00</div>

<ul id='numbers-list' class='list'>
  <li>uno</li>
  <li>dos</li>
</ul>

<p>Otro párrafo</p>

<form>
  <div>Form is surrounded by the green border.</div>
 
  <label for="name">Child of form:</label>
  <input name="name" id="name">
</form>

<script>
  $(function(){
    // agregar contenido html dentro de un elemento
    $('p').html('10.00 <span class="currency">MXN</span>');
    // agregar contenido tipo texto a un elemento
    $('form label:first-child').text('The first label:');
    // obtener el valor seleccionado de un elemento
    $('#name').val();
    // agregar contenido después de un elemento
    $('#numbers-list').after("<ul id='fruits-list'><li>Mango</li><li>Sandía</li></ul>");
    // agregar contenido antes de un elemento
    $('#numbers-list').after("<ul id='names-list'><li>Juan</li><li>Pedro</li></ul>");
    // remueve el elemento seleccionado
    $('p').remove();
    // reemplaza los elementos seleccionados con el contenido dado
    $('#numbers-list ul:last-child').replaceWith('<ul>Tres</ul>');
  });
</script>
</body>
</html>
```

#### Eventos
Proveen un medio para detectar eventos como un click, on hover, entre otros y de esta forma ejecutar acciones

Tipos:
* eventos del mouse
* eventos del teclado
* eventos de las formas
* event handlers

```html
<!DOCTYPE html>
<html>
<head>
<title>My page</title>
<!-- cargando jQuery desde un CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>
<p>Soy un elemento párrafo</p>

<a href='#' id='link' >Click me</a>

<ul id='numbers-list' class='list'>
  <li>uno</li>
  <li>dos</li>
</ul>

<form>
  <div>Form is surrounded by the green border.</div>
 
  <label for="name">Child of form:</label>
  <input name="name" id="name">
</form>

<script>
  $(function(){
    // Se utiliza normalmente el evento handler .on seguido del nombre del evento
    $('#link').on('click', function(event){
      alert('link was clicked');
      event.preventDefault();
    });
  
    $('#link').on('hover', function(event){
      alert('link was hover');
    });
  
    $('form').on('submit', function(event){
      alert('form submited');
      event.preventDefault();
    });
  });
</script>
</body>
</html>
```

#### Ajax
Nos permite realizar peticiones a servicios externos sin la necesidad de refrescar el navegador

```html
<!DOCTYPE html>
<html>
<head>
<title>My page</title>
<!-- cargando jQuery desde un CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
</head>
<body>
<div id='result'></div>

<script>
  $(function(){
    $.get( "https://api.fixer.io/latest", function(data) {
      $( "#result" ).html(data.rates['MXN']);
    });
  });
</script>
</body>
</html>
```

#### Referencias
- [Manipulación básica directa del DOM](http://callmenick.com/post/basics-javascript-dom-manipulation)
- [jQuery manipulación de contenido](https://api.jquery.com/category/manipulation/)
- [jQuery selectores](https://api.jquery.com/category/selectors/)
- [jQuery eventos](https://api.jquery.com/category/events/)
- [jQuery ajax](https://api.jquery.com/category/ajax/)
- [jQuery manipulación de CSS](https://api.jquery.com/category/css/)

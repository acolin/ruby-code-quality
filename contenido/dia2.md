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

```javascript

```

#### Manipulando contenido
Nos ayudan principalmente a condicionar el flujo de ejecución de nuestros programas.

```javascript
```

#### Eventos
Nos ayudan a realizar operaciones repetitivas sobre sets de datos.

```javascript
```

#### Ajax
Es la forma más básica de abstracción y reutilización de nuestro código.

```javascript
```

#### Referencias

- [jQuery manipulación del DOM](https://api.jquery.com/category/manipulation/)

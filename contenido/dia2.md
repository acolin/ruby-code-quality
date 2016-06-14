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
  });
  
  // Una forma más corta que hace lo mismo
  $(function(){
    // Tu código aquí
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

### Eventos
Nos ayudan a realizar operaciones repetitivas sobre sets de datos.

```javascript
```

### Ajax
Es la forma más básica de abstracción y reutilización de nuestro código.

```javascript
```

#### Referencias

- [Eloquent Javascript](http://eloquentjavascript.net/)

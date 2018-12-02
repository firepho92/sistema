class Producto {
  constuctor(producto, precio, stock, descripcion, imagen, categoria) {
    this.producto = {
      producto: producto,
      precio: precio,
      stock: stock,
      descripcion: descripcion,
      imagen: imagen,
      categoria: categoria
    }
  }

  createProducto() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost/sistema/cgi-bin/createProductos.pl', true);
    xhr.onreadystatechange = function() {
      if(xhr.readyState === XMLHttpRequest.DONE){
        console.log(true);
      }
    }
  }

  readProducto() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost/sistema/cgi-bin/readProductos.pl', true);
    xhr.onreadystatechange = function() { // Call a function when the state changes.
      if (xhr.readyState === XMLHttpRequest.DONE) {
        document.getElementById('response').innerHTML = xhr.response;
      }
    }
    xhr.setRequestHeader(
      'Content-Type', 
      'application/x-www-form-urlencoded'
    );
    xhr.send();
  }
}
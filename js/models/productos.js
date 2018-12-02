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
    return new Promise((resolve, reject) => {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', 'http://localhost/sistema/cgi-bin/readProductos.pl?type=cliente', true);
      xhr.onreadystatechange = function() { // Call a function when the state changes.
        if (xhr.readyState === XMLHttpRequest.DONE) {
          resolve(xhr.response);
        }
      }
      xhr.setRequestHeader(
        'Content-Type', 
        'application/x-www-form-urlencoded'
      );
      xhr.send();
    });
  }
  
}
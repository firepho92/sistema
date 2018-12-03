class Categoria {
  constuctor(categoria) {
    this.producto = {
      categoria: categoria
    }
  }

  createCategoria() {
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'http://localhost/sistema/cgi-bin/createCategoria.pl', true);
    xhr.onreadystatechange = function() {
      if(xhr.readyState === XMLHttpRequest.DONE){
        console.log(true);
      }
    }
  }

  readCategoria() {
    return new Promise((resolve, reject) => {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', 'http://localhost/sistema/cgi-bin/readCategorias.pl', true);
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
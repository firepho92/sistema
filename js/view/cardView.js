async function renderCards() {
  var productos = new Producto();
  productos = await productos.readProducto();
  productos = splitString(productos);
  console.log(productos);
  var cont = 0;
  var render = '';
  for(var i = 0; i < productos.length; i++) {
    var pre = '<div class="row">';
    var post = '</div>';
    var card = `
      <div class="item" id="item${productos[i][0]}">
        <div class="item-img">
          <img src="${productos[i][5]}"/>
        </div>
        <div class="item-text">
          <h3>${productos[i][1]}</h3>${productos[i][2]} <br/>
          <a id="${productos[i][0]}" href="#" onclick="event.preventDefault();test(this.id);">Mostrar información</a> <br/><br/>${productos[i][4]}
        </div>
        <div class="item-row-button">
          <div class="item-button">Agregar a carrito</div>
        </div>
      </div>
    `;
    if(cont === 0) render += pre;
    render += card;
    if(cont == 3) {
      render += post;
      cont = -1;
    }
    cont++;
  }
  document.getElementById('items-cards').innerHTML = render;
}
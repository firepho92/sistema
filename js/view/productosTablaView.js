async function renderProductosTablaView() {
  var productos = new Producto();
  productos = await productos.readProducto();
  productos = splitString(productos);
  var render = `
    <tr>
      <th>Identificador</th>
      <th>Producto</th>
      <th>Precio</th>
      <th>Stock</th>
      <th>Descripción</th>
      <th>Imagen</th>
      <th>Categoría</th>
    </tr>
    <tbody>`;
  for(var i = 0; i < productos.length; i++) {
    var row = `
      <tr id="${productos[i][0]}">
        <td>${productos[i][0]}</td><td>${productos[i][1]}</td><td>${productos[i][2]}</td><td>${productos[i][3]}</td><td>${productos[i][4]}</td><td>${productos[i][5]}</td><td value="${productos[i][6]}">${productos[i][7]}</td>
      </tr>
    `;
    render += row;
  }
  render += `</tbody>`;
  document.getElementById('tabla').innerHTML = render;
  document.getElementById('tableTitle').innerHTML = 'Productos';
}
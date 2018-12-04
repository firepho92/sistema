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
  var form = `
    <form action="/cgi-bin/createProducto.pl" enctype="multipart/form-data">
      <input type="text" name="producto">
      <input type="text" name="precio">
      <input type="text" name="stock">
      <input type="text" name="descripcion">
      <p>Subit imagen: <input type="file" name="imagen"></p>
      <select name="categoria">
        <option>1</option>
      </select>
      <button type="submit">Agregar</button>
    </form>
  `;
  document.getElementById('span-form').innerHTML = form;
  document.getElementById('form-table').innerHTML = 'Agregar producto';
}
async function renderCategoriasTablaView() {
  var categorias = new Categoria();
  categorias = await categorias.readCategoria();
  categorias = splitString(categorias);
  var render = `
  <tr>
    <th>Identificador</th>
    <th>Categoría</th>
  </tr>
  <tbody>`;
  for(var i = 0; i < categorias.length; i++) {
    var row = `
      <tr id="${categorias[i][0]}">
        <td>${categorias[i][0]}</td><td>${categorias[i][1]}</td>
      </tr>
    `;
    render += row;
  }
  render += `</tbody>`;
  document.getElementById('tabla').innerHTML = render;
  document.getElementById('tableTitle').innerHTML = 'Categorias';
}
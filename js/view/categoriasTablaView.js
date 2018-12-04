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
  var form = `
    <form id="form" onsubmit="event.preventDefault();createCategoria();">
      <input type="text" name="categoria" id="categoria/>
      <button type="submit">Agregar</button>
    </form>
  `;
  document.getElementById('span-form').innerHTML = form;
  document.getElementById('form-table').innerHTML = 'Agregar categoría';
}

async function createCategoria() {
  var categoria = new Categoria();
  //var form = new FormData(document.getElementById('form'));
  //form.append('foo', 'foo');
  //console.log(form);
}
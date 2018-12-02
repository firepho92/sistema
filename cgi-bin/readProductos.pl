#!/usr/bin/perl

use DBI;
use CGI;

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;

my $req = CGI::new();
my $reqtype = $req->param("type");

my $query = $connection->prepare("SELECT Productos.id_producto, Productos.producto, Productos.precio, Productos.stock, Productos.descripcion, Productos.imagen, Productos.categoria, Categorias.categoria FROM Productos INNER JOIN Categorias ON Productos.categoria = Categorias.id_categoria");
$query->execute();

print "Content-type: text/x-www-form-urlencoded\n\n";
=begin
print '<h1>'.$reqtype.'</h1>';

if($reqtype == "admin") {
  print '<table>
            <tr>
              <th>Identificador</th>
              <th>Producto</th>
              <th>Precio</th>
              <th>Stock</th>
              <th>Descripción</th>
              <th>Imagen</th>
              <th>Categoría</th>
            </tr>';
  while(@row = $query->fetchrow_array()) {
    print '<tr><td>'.@row[0].'</td><td>'.@row[1].'</td><td>'.@row[2].'</td><td>'.@row[3].'</td><td>'.@row[4].'</td><td>'.@row[5].'</td><td>'.@row[6].'</td><td>'.@row[7].'</td></tr>';
  }
  print '</table>';
} else {
  my $i = 0;
  while(@row = $query->fetchrow_array()) {
    if($i == 0){print '<div class="row">';}
    print '<div class="item" id="item'.@row[0].'"><div class="item-img"><img src="'.@row[5].'"/></div><div class="item-text"><h3>'.@row[1].'</h3>'.@row[2].' <br/><a id='.@row[0].' href="#" onclick="event.preventDefault();test(this.id);">Mostrar información</a> <br/><br/>'.@row[4].'</div><div class="item-row-button"><div class="item-button">Agregar a carrito</div></div></div>';
    if($i == 3){print '</div>'; $i = -1;}
    $i++;
  }
}
=cut
while(@row = $query->fetchrow_array()) {
  print @row[0] . ',' . @row[1] . ',' . @row[2] . ',' . @row[3] . ',' . @row[4] . ',' . @row[5] . ',' . @row[6] . ',' . @row[7] . "\n";
}
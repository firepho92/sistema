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

while(@row = $query->fetchrow_array()) {
  print @row[0] . ',' . @row[1] . ',' . @row[2] . ',' . @row[3] . ',' . @row[4] . ',' . @row[5] . ',' . @row[6] . ',' . @row[7] . "\n";
}
#!/usr/bin/perl

use DBI;
use CGI;

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;

my $req = CGI::new();
my $categoria = $req->param("categoria");

my $query = $connection->prepare("INSERT INTO Categorias(categoria) VALUES(?)");

print "Content-type: text/x-www-form-urlencoded\n\n";

if($query->execute($categoria)){
  print "Operacion exitosa";
}else{
  print "Error en la operacion";
}

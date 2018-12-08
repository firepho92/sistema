#!/usr/bin/perl -wT

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use DBI;
use File::Basename;

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth)
    or die "connection failed " . DBI->errstr;

$CGI::POST_MAX = 1024 * 500000;
my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir = "/opt/lampp/htdocs/sistema/img";

my $query = new CGI;
my $producto = $query->param("producto");
my $precio = $query->param("precio");
my $stock = $query->param("stock");
my $descripcion = $query->param("descripcion");
my $filename = $query->param("imagenNombre");
my $categoria = $query->param("categoria");

if ( !$filename ) {
  print $query->header ( );
  print "Hubo un problema subiendo tu foto.";
  exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '..*' );
$filename = $name . $extension;
$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;

if ( $filename =~ /^([$safe_filename_characters]+)$/ ) {
  $filename = $1;
}
else {
  die "Filename contains invalid characters";
}

my $upload_filehandle = $query->upload("imagen");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> ) {
  print UPLOADFILE;
}

close UPLOADFILE;
$filename = "img/" . $filename;
my $statement = $connection->prepare("INSERT INTO Productos(producto, precio, stock, descripcion, imagen, categoria) VALUES(?, ?, ?, ?, ?, ?)");
print $query->header();

if($statement->execute($producto, $precio, $stock, $descripcion, $filename, $categoria)){
  print "Operacion exitosa";
}else{
  print "Error en la operacion";
}
#!/usr/bin/perl
use strict;
use DBI;
use CGI::Carp qw(fatalsToBrowser);
use File::Basename;

$CGI::POST_MAX = 1024 * 10000;

my $safe_filename_characters = "a-zA-Z0-9_.-";
my $upload_dir = "/opt/lampp/htdocs/upload";

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;

my $req = CGI::new();

my $producto = $req->param("producto");
my $precio = $req->param("precio");
my $stock = $req->param("stock");
my $descripcion = $req->param("descripcion");
my $imagen = $req->param("imagen");
my $categoria = $req->param("categoria");

print "Content-type: text/x-www-form-urlencoded\n\n";
if(!imagen) {
  print "Hubo un problema subiendo la imagen, intenta con un tamaño mas pequeno";
  exit;
}

my ($nombre, $path, $extension) = fileparse ($imagen, '..*');
$imagen = $nombre . $extension;

$imagen =~ tr/ /_/;
$imagen =~ s/[^$safe_filename_characters]//g;

if ( $imagen =~ /^([$safe_filename_characters]+)$/ ) { 
  $imagen = $1;
} else {
  die "El archivo contiene caracteres invalidos";
}

my $upload_imagenHandle = $req->upload("foto");

open ( UPLOADFILE, ">$upload_dir/$imagen" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> ) {
  print UPLOADFILE;
}

close UPLOADFILE;

my $query = $connection->prepare("INSERT INTO Productos(producto, precio, stock, descripcion, imagen, categoria) VALUES(?, ?, ?, ?, ?, ?)");

if($query->execute($categoria)){
  print "Operacion exitosa";
}else{
  print "Error en la operacion";
}

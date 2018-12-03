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

my $query = $connection->prepare("SELECT id_categoria, categoria FROM Categorias");
$query->execute();

print "Content-type: text/x-www-form-urlencoded\n\n";

while(@row = $query->fetchrow_array()) {
  print @row[0] . ',' . @row[1] . "\n";
}
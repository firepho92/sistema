#!/usr/bin/perl

use DBI;

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;
my $query = $connection->prepare("SELECT * FROM Productos");
$query->execute();

print "Content-type: text/plain\n\n";

#print $query;

while(@row = $query->fetchrow_array()){
  print @row[0] . " " . @row[1] . " " . @row[2] . " " . @row[3] . " " . @row[4] . " " . @row[5] . " " . @row[6] . "\n";
}
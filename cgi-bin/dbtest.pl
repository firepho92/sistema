#!/usr/bin/perl

use DBI;

my $data_source = "DBI:mysql:sandbox:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;
$query = $connection->prepare("SELECT a FROM tabla");
$query->execute();

print "Content-type: text/plain\n\n";

while(@row = $query->fetchrow_array()){
    print @row[0] . "\n";
}
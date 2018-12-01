#!/usr/bin/perl

use DBI;

my $data_source = "DBI:mysql:tienda:localhost";
my $username = "root";
my $auth = "";

my $connection = DBI->connect($data_source, $username, $auth, \%attr)
    or die "connection failed " . DBI->errstr;
my $query = $connection->prepare("SELECT * FROM Productos");
$query->execute();

print "Content-type: text/x-www-form-urlencoded\n\n";

my $i = 0;
while(@row = $query->fetchrow_array()){
  if($i == 0){print '<div class="row">';}
  print '<div class="item" id="item"'.@row[0].'><div class="item-row-multimedia"><div class="item-img"><img src="'.@row[5].'" height="192" width="192"/></div><div class="item-text"><p>'.@row[1].'</p><p>'.@row[4].'</p><p>'.@row[2].'</p></div></div><div class="item-row-button"><div class="item-button">Agregar a carrito</div></div></div>';
  if($i == 2){print '</div>'; $i = -1;}
  $i++;
}
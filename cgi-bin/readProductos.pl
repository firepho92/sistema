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
  print '<div class="item" id="item'.@row[0].'"><div class="item-img"><img src="'.@row[5].'"/></div><div class="item-text"><h3>'.@row[1].'</h3>'.@row[2].' <br/><a id='.@row[0].' href="#" onclick="event.preventDefault();test(this.id);">Mostrar información</a> <br/><br/>'.@row[4].'</div><div class="item-row-button"><div class="item-button">Agregar a carrito</div></div></div>';
  if($i == 3){print '</div>'; $i = -1;}
  $i++;
}
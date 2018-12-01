#!/usr/bin/perl

use CGI;


$req = CGI::new();
$hola = $req->param("foo");
print $req->header('text/plain');
print $hola;
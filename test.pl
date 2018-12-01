#!/usr/bin/perl

use strict;
use warnings;

use CGI;

my $q = CGI->new;
my $foo = $q->param( 'foo' );

print $q->header;
print "You said $foo";

$body = new CGI;
#print $q->header('text/plain');
print $body->param('foo');
my $foo = $body->param('foo');

#print "Content-type: text/plain\n\n";
#print $q->header;
print "Content-type: text/plain\n\n";
print $foo;
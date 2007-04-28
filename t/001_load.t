# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'Catalyst::Controller::PathArgs' ); }

my $object = Catalyst::Controller::PathArgs->new ();
isa_ok ($object, 'Catalyst::Controller::PathArgs');



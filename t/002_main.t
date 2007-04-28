use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";
#use lib 'lib';


use Test::More tests => 3;
use Catalyst::Test 'TestApp';

{
    my @expected = qw[
    TestApp::Controller::Root->pathargsroot
    TestApp::Controller::Pathargsroot->pathargsend 
    TestApp::Controller::Root->end
    ];

    my $expected = join( ", ", @expected );

    ok( my $response =
        request('http://localhost/pathargsroot/1/pathargsend/2'),
         'path_args' );
    is( $response->header('X-Catalyst-Executed'),
        $expected, 'Executed actions' );
    is( $response->content, '1; 2', 'Content OK' );
}


package TestApp::Controller::Pathargsroot;

use base 'Catalyst::Controller::PathArgs';


sub pathargsend : PathArgs(1) EndPoint { }

sub aaa : Local {}

1;


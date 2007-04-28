package MyApp::Controller::Book::Edition;

use base 'Catalyst::Controller::PathArgs';
use strict;
use warnings;

sub view : PathArgs(0) EndPoint {
    my ( $self, $c ) = @_;
    my $out = "This is the MyApp::Controller::Book::Edition controller's chained view action. ";
    $out .= "The book with id = " . $c->stash->{book}->{id} . " is on the stash. ";
    $out .= "It's edition with id = " . $c->stash->{edition}->{id} . " is on the stash. ";
    $out .= 'It\'s text is "' . $c->stash->{edition}->{text} . '" .';
    $c->response->body( $out );
}

sub chained_index : PathPart('') PathArgs(0) EndPoint {
    my ( $self, $c ) = @_;
    my $out = "This is the MyApp::Controller::Book::Edition controller's chained index action. ";
    $out .= "The book with id = " . $c->stash->{book}->{id} . " is on the stash. ";
    $out .= "It's edition with id = " . $c->stash->{edition}->{id} . " is on the stash.";
    $c->response->body( $out );
}


1;


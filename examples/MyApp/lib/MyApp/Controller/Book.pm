package MyApp::Controller::Book;

use base 'Catalyst::Controller::PathArgs';
use strict;
use warnings;

sub edition : PathArgs(1) {
    my ( $self, $c, $id ) = @_;
    my $edition = $c->stash->{book}->{$id};
    $c->stash->{edition} = $edition;
}

sub edition_mascarade: PathPart('edition') PathArgs(0) EndPoint {
    my ( $self, $c ) = @_;
    my $out = "This is the MyApp::Controller::Book controller's edition_mascarade action with 0 params.";
    $out .= "The book with id = " . $c->stash->{book}->{id} . " is on stash";
    $c->response->body( $out );
}

sub index : Private {
    my ( $self, $c ) = @_;
    my $out = "This is the MyApp::Controller::Book controller's index action.";
    $c->response->body( $out );
}

sub chained_index : PathPart('') PathArgs(0) EndPoint {
    my ( $self, $c ) = @_;
    my $out = "This is the MyApp::Controller::Book controller's chained index action.";
    $out .= "The book with id = " . $c->stash->{book}->{id} . " is on stash";
    $c->response->body( $out );
}

1;


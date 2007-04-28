package MyApp::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller::PathArgs';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

MyApp::Controller::Root - Root Controller for MyApp

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 default

=cut

sub index : Private {
    my ( $self, $c ) = @_;
    $c->response->body( "This is the MyApp::Controller::Root controller's index action" );
}

our $books = {
1 => {
id => 1,
1 => { id => 1, text => 'Book 1 Edition 1' },
2 => { id => 2, text => 'Book 1 Edition 2' },
3 => { id => 3, text => 'Book 1 Edition 3' },
},
2 => { 
id =>  2,
1 => { id => 1, text => 'Book 2 Edition 1' },
2 => { id => 2, text => 'Book 2 Edition 2' },
3 => { id => 3, text => 'Book 2 Edition 3' },
},
3 => { 
id =>  3,
1 => { id => 1, text => 'Book 3 Edition 1' },
2 => { id => 2, text => 'Book 3 Edition 2' },
3 => { id => 3, text => 'Book 3 Edition 3' },
}
};

sub book : PathArgs(1) {
    my ( $self, $c, $id ) = @_;
    my $book = $books->{$id};
    $c->stash->{book} = $book;
}

1;

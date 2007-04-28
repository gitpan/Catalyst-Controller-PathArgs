package TestApp::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller::PathArgs';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

sub pathargsroot : PathArgs(1) {}

sub end : Private {
  my ($self, $c) = @_;
  return if $c->stash->{no_end};
  my $out = join('; ', map { join(', ', @$_) }
                         ($c->req->captures, $c->req->args));
  $c->res->body($out);
}

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

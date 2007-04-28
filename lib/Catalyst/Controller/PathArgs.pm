package Catalyst::Controller::PathArgs;
use strict;
use base 'Catalyst::Controller';
use Class::C3;

our $VERSION = '0.1';


sub create_action {
    my $self = shift;
    my %args = @_;
    my $attributes = $args{attributes};
    if ( my $args_num = $attributes->{PathArgs} ){
        $attributes->{Chained} = [ '.' ];
        if ( $attributes->{EndPoint} ){
            $attributes->{Args} = [ $args_num->[0] ];
        }else{
            $attributes->{CaptureArgs} = [ $args_num->[0] ];
        }
    }
    return $self->next::method( %args );
}


#################### main pod documentation begin ###################


=head1 NAME

Catalyst::Controller::PathArgs - syntactic sugar for
L<Catalyst::DispatchType::Chained>.

=head1 SYNOPSIS

  package MyApp::Controller::Root;
  use base 'Catalyst::Controller::PathArgs';
  __PACKAGE__->config->{namespace} = '';

  sub pathargsroot : PathArgs(1) {}
  
  use Catalyst::Controller::PathArgs;
  package TestApp::Controller::Pathargsroot;

  use base 'Catalyst::Controller::PathArgs';


  sub pathargsend : PathArgs(1) EndPoint { }

=head1 DESCRIPTION

This Catalyst Controller base adds two new action attributes: PathArgs (taking
one numerical argument) and EndPoint.  This is entirely syntactic sugar over
the L<Catalyst::DispatchType::Chained> full machinery for paths like
'/book/$book_id/edition/$edition_id/view' - with PathArgs you can chain the
'book', 'edition' and 'view' methods and declare how many parameters they take.
EndPoint is needed to declare an ation as the end of the chain (in theory this
should be computable - but for now I don't see any easy way to do that).

This package uses L<Class::C3> this means that you cannot use NEXT in classes
based on it - but C3 looks like a good replacement for NEXT.

To declare that the book subroutine is the root chained action with one argument you
need to declare it in the Root controller with:

  sub book : PathArgs(1) {

If we had a non chained path with /book/edition - the edition sub would be
declared in the 'Book' controller - and this is the same case here - you just
add PathArgs(1) to indicate that it is indeed chained and that it takes one
parameter. So in the Book controller you add: 

  sub edition : PathArgs(1) {

For the last action in the chain you need to add EndPoint.  So in the
Book::Edition controller you would need: 

  sub view : PathArgs(0) EndPoint {

You can also mix PathArgs with PathPart (new in Catalyst 5.7007).  For example
if you wanted to have an action responding for the address
"/book/$book_id/edition" you would need a subroutine called 'edition' in the
Book controller, but there is already one routine called 'edition' in that
controller.  What you can do in that case is make a sub with a different name
and declare that from the outside it's name should be really 'edition':

  sub edition_mascarade: PathPart('edition') PathArgs(0) EndPoint {

yeah - you need to add EndPoint there as well.

An example is included in the example directory of this distribution.

Internally PathArgs and EndPoint are converted to 'Chained(.)' and appriopriate 
CaptureArgs or Args attributes.  For more sophisticated chaining you might need
to use L<Catalyst::DispatchType::Chained> directly.

=head2 create_action

This is the overriden method from Catalyst::Controller used here to compute the
new attributes. 

=head1 LIMITATIONS

Using this module forces you to have a directory structure of the modules
similar to the external paths that you want to serve.  For example to serve the
external path of '/book/$book_id/edition/$edition_id/view' you need to have a
module 'Book/Edition.pm'. If you want to build your modules directory structure
completely independently from the path served you need the full power of
L<Catalyst::DispatchType::Chained>.  To convert a script using PathArgs to the
original Chained just change every PathArgs($number) to 'Chained('.')
CaptureArgs($number)' or 'Chained('.') Args($number)' if it is an 'EndPoint'.


=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

    Zbigniew Lukasiak
    CPAN ID: ZBY 
    http://perlalchemy.blogspot.com/

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

L<Catalyst::DispatchType::Chained>

=cut

#################### main pod documentation end ###################


1;


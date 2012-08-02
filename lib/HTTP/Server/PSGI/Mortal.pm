package HTTP::Server::PSGI::Mortal;
use strict;
use warnings;
use parent 'HTTP::Server::PSGI';

our $VERSION = '0.01';

sub handle_connection {
  my ($self, $env, $conn, $app) = @_;

  $self->SUPER::handle_connection($env, $conn, $app);

  if ($self->{TIME_TO_DIE}) {
    $conn->close;
    no warnings 'exiting';
    last; # breaks the loop in SUPER::accept_loop
  }
}

sub _handle_response {
  my($self, $res, $conn) = @_;

  my %headers = @{$res->[1]};
  $self->{TIME_TO_DIE} = 1 if $headers{TIME_TO_DIE};
  return $self->SUPER::_handle_response($res, $conn);
}

1; # End of HTTP::Server::PSGI::Mortal

__END__


=head1 NAME

HTTP::Server::PSGI::Mortal - An HTTP server that can be killed by an application

=head1 SYNOPSIS

  my $server = HTTP::Server::PSGI::Mortal->new(%args);
  $server->run($app); # run $app until a response emits 'TIME_TO_DIE'
  
  # now pursue program execution

=head1 DESCRIPTION

This server behaves exactly like L<HTTP::Server::PSGI>, except that whenever
a response contains a true value in header C<TIME_TO_DIE>,
the server's accept loop will stop.

It may be useful if you want a program to become a HTTP server at some
point, until a specific request ends the service and the program
resumes normal execution.  This is what happens for example in
L<Tree::Navigator::App::PerlDebug>, where a call to C<debug()> stops
normal program execution, starts a web server to browse through
datastructures and packages, until the web server is stopped through a
C<_KILL> http request.

=head1 STOPPING THE SERVER

For stopping the server, the application hosted by the call to
C<< $server->run($app) >> should issue a response containing
a special header named C<TIME_TO_DIE>, with a true value.

=head1 AUTHOR

Laurent Dami, C<< <dami at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Laurent Dami.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut



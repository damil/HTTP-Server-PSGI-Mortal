package Plack::Handler::HTTP::Server::PSGI::Mortal;
use strict;
use warnings;
use HTTP::Server::PSGI::Mortal;
use parent 'Plack::Handler::HTTP::Server::PSGI';

sub _server {
  my $self = shift;
  HTTP::Server::PSGI::Mortal->new(%$self);
}

1;

__END__

=head1 NAME

Plack::Handler::HTTP::Server::PSGI::Mortal - adapter for HTTP::Server::PSGI::Mortal

=head1 SYNOPSIS

  % plackup -s HTTP::Server::PSGI::Mortal \
      --host 127.0.0.1 --port 9091 --timeout 120

=head1 DESCRIPTION

This is a Plack adapter for L<HTTP::Server::PSGI::Mortal>.
It inherits from L<Plack::Handler::HTTP::Server::PSGI>
and behaves exactly the same, except for the server class.

=head1 AUTHOR

Laurent Dami, C<< <dami at cpan.org> >>

=head1 SEE ALSO

L<Plack> L<HTTP::Server::PSGI>

=head1 LICENSE AND COPYRIGHT

Copyright 2012 Laurent Dami.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

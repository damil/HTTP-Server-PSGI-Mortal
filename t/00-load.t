#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok( 'HTTP::Server::PSGI::Mortal' );
    use_ok( 'Plack::Handler::HTTP::Server::PSGI::Mortal' );
}

diag( "Testing HTTP::Server::PSGI::Mortal $HTTP::Server::PSGI::Mortal::VERSION, Perl $], $^X" );

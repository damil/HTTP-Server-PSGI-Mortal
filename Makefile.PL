use inc::Module::Install;

name     'HTTP-Server-PSGI-Mortal';
all_from 'lib/HTTP/Server/PSGI/Mortal.pm';
author   q{Laurent Dami <dami@cpan.org>};
license  'perl';

requires      'parent';
requires      'HTTP::Server::PSGI';
test_requires 'Test::More';
test_requires 'Test::TCP';
test_requires 'LWP::UserAgent';
test_requires 'Plack::Runner';

auto_install;

WriteAll;


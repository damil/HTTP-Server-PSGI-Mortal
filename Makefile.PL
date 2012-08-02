use inc::Module::Install;

name     'HTTP-Server-PSGI-Mortal';
all_from 'lib/HTTP/Server/PSGI/Mortal.pm';
author   q{Laurent Dami <dami@cpan.org>};
license  'perl';

requires 'parent';

build_requires 'Test::More';

auto_install;

WriteAll;


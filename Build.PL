#!perl

use strict;
use warnings;
use Module::Build;
use File::Spec;

my $path = File::Spec->catfile( "lib", "File", "Temp.pm" );

# Set it up.
my $build = Module::Build->new
  (
   module_name => 'File::Temp',
   license  => 'perl',
   dist_author => 'Tim Jenness <tjenness@cpan.org>',
   version_from => $path,
   abstract_from => $path,
   meta_merge => {
               resources =>  {repository => "git://github.com/timj/perl-File-Temp.git",
                              homepage => "http://github.com/timj/perl-File-Temp/tree/master",
                             },
                },
   requires => {
                'File::Spec' => 0.8,
                'File::Path' => 2.06,
                Fcntl => 1.03,
               },
   build_requires => {
                      'Test::More' => 0,
                      'Cwd' => 0,
                     },
   installdirs => ( $] > 5.006 ? "core" : "site" ),
  );

$build->create_build_script;

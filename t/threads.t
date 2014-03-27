#!/usr/local/bin/perl -w
# Test for File::Temp - tempfile function

use strict;
use warnings;
use Test::More tests => 2;
use File::Spec;
use threads;

use File::Temp qw/ tempfile tempdir/;

ok( 1, "Start test" );

my $tempdir = File::Temp->newdir(
    TEMPLATE => "customXXXXX",
    DIR      => File::Spec->curdir,
    CLEANUP  => 1,
);

my $thr = threads->create( sub { } );

while ( $thr->is_running ) {
    sleep 1;
}

$thr->detach;

ok( ( -d $tempdir ), "Temp directory exists after thread destroyed" );

1;
__END__

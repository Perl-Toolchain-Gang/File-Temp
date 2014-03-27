#!/usr/local/bin/perl -w
# Test for File::Temp - tempfile function

use strict;
use warnings;
use Test::More;
use File::Spec;
use File::Temp qw/tempfile tempdir/;

BEGIN {
    eval { require threads };
    if ($@) {
        plan skip_all => 'Threads not available';
    }
    else {
        plan tests => 2;

        # use_ok( "File::Temp" );
    }
}

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

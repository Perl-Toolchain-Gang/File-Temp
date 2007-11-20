#!perl -w
# Test O_EXLOCK

use Test::More;
use strict;
use Fcntl;

BEGIN {use_ok( "File::Temp" ); }

# see if we have O_EXLOCK
eval { &Fcntl::O_EXLOCK; };
if ($@) {
  plan skip_all => 'Do not seem to have O_EXLOCK';
} else {
  plan tests => 3;
}

# Get a tempfile with O_EXLOCK
my $fh = new File::Temp();
ok( -e "$fh", "temp file is present" );

# try to open it
my $status = open my $newfh, "> $fh";
ok( !$status, "File is locked" );

# Now get a tempfile with locking disabled
$fh = new File::Temp( EXLOCK => 0 );
$status = open $newfh, "> $fh";
ok( $status, "File is not locked");

#!/usr/bin/perl

use Test::More tests => 1;

use File::Spec;
use File::Path;
use autodie;
use File::Temp;

rmtree "testing";
mkdir "testing";
chdir "testing";
mkdir "tmp";

my $tempdirstr;
{
    my $dir = File::Temp->newdir( DIR => "tmp" );
    $tempdirstr = "$dir";

    mkdir "hide";
    chdir "hide";
}

chdir File::Spec->updir;
$tempdirstr = File::Spec->rel2abs($tempdirstr);
ok !-d $tempdirstr or diag dircontent("tmp", $tempdirstr);

# cleanup
chdir File::Spec->updir;
rmtree( "testing" );

exit;

sub dircontent {
  use autodie;
  my $dir = shift;
  my $tempdirstr = shift;
  my $str = "Contents of $dir (should not contain \"$tempdirstr\"):\n";
  opendir(my $DH, $dir);
  my @contents = grep { $_ !~ /^\.+/; } readdir($DH);
  closedir($DH);
  for my $ls (@contents) {
    $str .= "  $ls\n";
  }
  return $str;
}
